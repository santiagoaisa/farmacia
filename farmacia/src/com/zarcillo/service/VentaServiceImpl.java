package com.zarcillo.service;

import com.zarcillo.dao.ClienteDAO;
import com.zarcillo.dao.CondicionVentaDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DescuentoDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.VendedorDAO;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
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
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
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
public class VentaServiceImpl extends Entrada  implements VentaService {

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
    private LoteDAO lotedao;
    @Autowired
    private DescuentoDAO descuentodao;

    @Override
    @Transactional
    public Integer registrar(RegistroSalida regsalida, Almacen almacen) {
        try {
            int tamaño_pedido = regsalida.getIddocumento().getNitems();
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
            throw new ExceptionZarcillo(e.getMessage());
        }
        
        return regsalida.getIdregsalida();
    }

    @Override
    @Transactional
    public DetalleVenta detalleVenta(Integer idunidad, Cliente cliente, Existencia existencia, Usuario idusuario) {
        // Logica de Descuentos
        DetalleVenta detalle = new DetalleVenta();
        Descuento descuento;
        try {
            /// controlo los negativos del temporal
            if (existencia.getNtemporal() < 0) {
                existencia.setNtemporal(0);
            }
            Integer lote_bloqueado = lotedao.cantidadBloqueadaPorIdalmacenPorIdproductoBloqueados(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
            detalle.setNstock(existencia.getNstock() - existencia.getNtemporal() - lote_bloqueado);

            if (detalle.getNstock() <= 0) {
                // productos no vendidos                                        
                if (lote_bloqueado != 0) {
                    throw new ExceptionZarcillo("El Lote del producto " + existencia.getIdproducto().getCnomproducto().trim() + " ha sido bloqueado");
                }
                throw new ExceptionZarcillo("El Producto " + existencia.getIdproducto().getCnomproducto().trim() + " tiene STOCK 0");
            }

            detalle.setExistencia(existencia);
            detalle.setNcosuni(existencia.getNcosuni());
            detalle.setBinafec(existencia.getIdproducto().getBinafecto());

            //ESTABLESCO EL INCREMENTO
            if (Numero.isCero(detalle.getNvaluni())) {
                detalle.setNvaluni(existencia.getNvalven());
            } else {
                detalle.setNvaluni(existencia.getNcosuni().add(detalle.getNcosuni().multiply(existencia.getIdproducto().getIdsublinea().getIdlinea().getNincremento().divide(Numero.cien))));
            }


            //detalle.setNvaluni(existencia.getNvalven());

            descuento = descuentodao.busquedaPorIdalmacenPorIdproducto(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
            detalle.setDescuento(descuento);
            detalle.setNdesfin(new BigDecimal("0"));

            //Margen Minimo a digitar
            detalle.setNmargenminimo(existencia.getIdproducto().getIdsublinea().getIdlinea().getNmargenminimo());

            ////// CONTROL DE PRODUCTOS SIN VALOR DE VENTA
            int rpta1 = detalle.getNvaluni().compareTo(new BigDecimal("0"));
            int rpta2 = detalle.getNcosuni().compareTo(new BigDecimal("0"));

            if (rpta1 < 1 && rpta2 >= 1) {
                throw new ExceptionZarcillo("El Producto " + existencia.getIdproducto().getIdproducto() + "-" + existencia.getIdproducto().getCnomproducto().trim() + " no tiene PRECIO");
            }

        } catch (Exception e) {
            if (e.getMessage().contains("STOCK")) {
                // productos no vendidos
                ProductoNoVendido producto = new ProductoNoVendido();
                producto.setIdalmacen(existencia.getIdalmacen());
                producto.setIdproducto(existencia.getIdproducto());
                producto.setIdcliente(cliente);
                producto.setIdunidad(new UnidadNegocio(idunidad));
                producto.setNcantidad(detalle.getNcantidad());
                producto.setIdusuario(idusuario);
                producto.setDfecreg(new Date());
                cruddao.registrar(producto);
            }
            throw new ExceptionZarcillo(e.getMessage());
        }

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
        return cruddao.listarTodos(CondicionVenta.class);
    }

    @Override
    public List<MotivoSalida> listaMotivo() {
        return cruddao.listarTodos(MotivoSalida.class);
    }

    @Override
    public List<Vendedor> listaVendedorActivo() {
        return vendedordao.listaPorBactivo();
    }
}
