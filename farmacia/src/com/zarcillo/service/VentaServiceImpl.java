package com.zarcillo.service;

import com.zarcillo.dao.ClienteDAO;
import com.zarcillo.dao.CondicionVentaDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DescuentoDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.MotivoSalidaDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.VendedorDAO;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.domain.ProductoNoVendido;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.negocio.Entrada;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("ventaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class VentaServiceImpl extends Entrada implements VentaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private VendedorDAO vendedordao;
    @Autowired
    private ClienteDAO clientedao;
    @Autowired
    private DocumentoDAO documentodao;
    @Autowired
    private NumeracionDAO numeraciondao;
    @Autowired
    private CondicionVentaDAO condicionventadao;
    @Autowired
    private DescuentoDAO descuentodao;
    @Autowired
    private MotivoSalidaDAO motivosalidadao;
    @Autowired
    private ExistenciaDAO existenciadao;

    @Override
    @Transactional
    public Integer registrar(RegistroSalida regsalida, Almacen almacen) {
        try {
            
            System.out.println("tamaño:"+regsalida.getMovimientoCollection().size());
            //////////VALIDAR STOCK DE FRACCION            
            validarStock(regsalida);
            regsalida.setIdmoneda(Moneda.SOLES);
            regsalida.setIdcliente(Cliente.BOLETA);
            regsalida.setIddocumento(documentodao.buscarPorCcodigosunat(Documento.BOLETA_SUNAT.getCcodigosunat()));
            ///////////
            
            // llaves ,le asigna una llave temporal id a cada movimiento
            super.llaves(regsalida);
            
            // descargo lotes y el pedido crece
            super.lotes(regsalida);
            
            // llaves ,le asigna una llave temporal id a cada movimiento
            super.llaves(regsalida);
            

            //1ro grabo el docmento original
            // si no es prestamos           
            super.registrar(regsalida);
            


        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }

        return regsalida.getIdregsalida();
    }

    @Override
    @Transactional
    public List<DetalleVenta> busquedaListaPorIdalmacenPorReceta(Integer idalmacen, String criterio) {
        List<DetalleVenta> listaRetorno = new ArrayList<>();

        try {
            List<Existencia> listaExistencia = existenciadao.busquedaListaPorIdalmacenPorReceta(idalmacen, criterio);
            // Logica de Descuentos
            DetalleVenta detalle;
            for (Existencia e : listaExistencia) {
                detalle = detalleParaVenta(idalmacen, e);
                listaRetorno.add(detalle);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
        /// controlo los negativos del temporal
        return listaRetorno;
    }

    @Override
    @Transactional
    public List<DetalleVenta> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen, String criterio) {

        List<DetalleVenta> listaRetorno = new ArrayList<>();

        try {
            List<Existencia> listaExistencia = existenciadao.busquedaListaPorIdalmacenPorDescripcion(idalmacen, criterio);
            // Logica de Descuentos
            DetalleVenta detalle;
            for (Existencia e : listaExistencia) {
                detalle = detalleParaVenta(idalmacen, e);
                listaRetorno.add(detalle);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
        /// controlo los negativos del temporal
        return listaRetorno;
    }

    @Override
    @Transactional
    public DetalleVenta detalleVenta(Integer idalmacen, Existencia existencia, Usuario idusuario) {
        // Logica de Descuentos
        DetalleVenta detalle = new DetalleVenta();

        try {
            /// controlo los negativos del temporal
//            if (existencia.getNtemporal() < 0) {
//                existencia.setNtemporal(0);
//            }

            detalle = detalleParaVenta(idalmacen, existencia);

            ////// CONTROL DE PRODUCTOS SIN VALOR DE VENTA
            int rpta1 = detalle.getNvaluni().compareTo(new BigDecimal("0"));
            int rpta2 = detalle.getNcosuni().compareTo(new BigDecimal("0"));

            if (rpta1 < 1 && rpta2 >= 1) {
                throw new ExceptionZarcillo("El Producto " + existencia.getIdproducto().getIdproducto() + "-" + existencia.getIdproducto().getCnomproducto().trim() + " no tiene PRECIO");
            }


            if (detalle.getNstock() <= 0) {
                // productos no vendidos
                throw new ExceptionZarcillo("El Producto " + existencia.getIdproducto().getCnomproducto().trim() + " tiene STOCK 0");
            }


        } catch (Exception e) {
            if (e.getMessage().contains("STOCK")) {
                // productos no vendidos
                ProductoNoVendido producto = new ProductoNoVendido();
                producto.setIdalmacen(existencia.getIdalmacen());
                producto.setIdproducto(existencia.getIdproducto());
                producto.setIdunidad(new UnidadNegocio(idalmacen));
                producto.setNcantidad(detalle.getNcantidad());
                producto.setIdusuario(idusuario);
                producto.setDfecreg(new Date());
                cruddao.registrar(producto);
            }
            throw new ExceptionZarcillo(e.getMessage());
        }

        return detalle;
    }

    private DetalleVenta detalleParaVenta(Integer idalmacen, Existencia existencia) {
        DetalleVenta detalle = new DetalleVenta();
        //Integer lote_bloqueado = lotedao.cantidadBloqueadaPorIdalmacenPorIdproductoBloqueados(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
        detalle.setNstock(existencia.getNstock());
        detalle.setNstockm(existencia.getNstockm());
//     
        detalle.setBactivo(!existencia.getBactivo());

        if (existencia.getIdproducto().getNmenudeo() > 1) {
            detalle.setBfraccion(false);
        }

        detalle.setExistencia(existencia);
        detalle.setNcosuni(existencia.getNcosuni());

        detalle.setBinafec(existencia.getIdproducto().getBinafecto());

        //ESTABLESCO EL INCREMENTO
        if (!Numero.isCero(existencia.getNvalven())) {
            detalle.setNvaluni(existencia.getNvalven());

            BigDecimal nvalorunitariofraccion = detalle.getNvaluni().divide(new BigDecimal(existencia.getIdproducto().getNmenudeo()), 4, BigDecimal.ROUND_HALF_UP);
            detalle.setNvalunim(nvalorunitariofraccion);
        } else {
            detalle.setNvaluni(existencia.getNcosuni().add(detalle.getNcosuni().multiply(existencia.getIdproducto().getIdsublinea().getIdlinea().getNincremento().divide(Numero.cien))));
            BigDecimal nvalorunitariofraccion = detalle.getNvaluni().divide(new BigDecimal(existencia.getIdproducto().getNmenudeo()), 4, BigDecimal.ROUND_HALF_UP);
            detalle.setNvalunim(nvalorunitariofraccion);
        }

        detalle.setNpreuni(Igv.importeDetalleVenta(detalle.getNvaluni(), detalle.getExistencia().getIdproducto().getBinafecto()));
        detalle.setNpreunim(Igv.importeDetalleVenta(detalle.getNvalunim(), detalle.getExistencia().getIdproducto().getBinafecto()));

        //detalle.setNvaluni(existencia.getNvalven());

        Descuento descuento = descuentodao.busquedaPorIdalmacenPorIdproducto(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
        detalle.setDescuento(descuento);
        detalle.setNdesfin(new BigDecimal("0"));

        //Margen Minimo a digitar
        detalle.setNmargenminimo(existencia.getIdproducto().getIdsublinea().getIdlinea().getNmargenminimo());

        return detalle;
    }

    @Override
    public List<Documento> listaDocumento(Integer idcliente) {
        Cliente cliente = clientedao.buscarPorIdcliente(idcliente);
        List<Documento> lista = new ArrayList<>();
        Documento documento;

        if (cliente.getCruc().trim().isEmpty()) {
            documento = documentodao.buscarPorCcodigosunat(Documento.BOLETA_SUNAT.getCcodigosunat());
            Numeracion numeracion = numeraciondao.buscarPorIdunidadPorIddocumento(cliente.getIdunidad().getIdunidad(), documento.getIddocumento());
            documento.setNitems(numeracion.getNitems());
            lista.add(documento);
        } else {
            documento = documentodao.buscarPorCcodigosunat(Documento.FACTURA_SUNAT.getCcodigosunat());
            Numeracion numeracion = numeraciondao.buscarPorIdunidadPorIddocumento(cliente.getIdunidad().getIdunidad(), documento.getIddocumento());
            documento.setNitems(numeracion.getNitems());
            lista.add(documento);
        }
        return lista;
    }

    @Override
    public List<CondicionVenta> listaCondicion() {
        return condicionventadao.listaGeneral();
    }

    @Override
    public List<MotivoSalida> listaMotivo() {
        return motivosalidadao.listaVenta();
    }

    @Override
    public List<Vendedor> listaVendedorActivo() {
        return vendedordao.listaPorBactivo();
    }

    private void validarStock(RegistroSalida regsalida) {
        try {
            List<Movimiento> listaMovimiento = regsalida.getMovimientoCollection();
            Existencia existencia;
            for (Movimiento m : listaMovimiento) {
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());

                if (m.getNcantidadm() > 0) {
                    // si es menudeo y tengo stock de menudeo
                    if (existencia.getNstockm() > m.getNcantidadm()) {
                        //no se hace nada
                    } else {
                        BigDecimal cantidadsalida = new BigDecimal(m.getNcantidadm()).divide(new BigDecimal(m.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                        if (Numero.isMayor(cantidadsalida, Numero.uno)) {
                            throw new ExceptionZarcillo("La cantidad vendida en fraccion es mayor a la cantidad de menudeo asignada");
                        } else {
                            //EN EL CASO QUE NO TENGA STOCK EN MENUDEO
                            //SE TIENE QUE REALIZAR UNA TRANSFERENCIA
                            super.transferenciaFraccion(regsalida, m);
                        }
                    }
                } else {
                    if (m.getNcantidad() > existencia.getNstock()) {
                        throw new ExceptionZarcillo("La cantidad vendida en entero es mayor a la cantidad vendida");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
