package com.zarcillo.negocio;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.ProductoDAO;
import com.zarcillo.dao.RegistroEntradaDAO;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Transferencia;
import com.zarcillo.service.ExceptionZarcillo;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Entrada extends Salida {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private ExistenciaDAO existenciadao;
    @Autowired
    private LoteDAO lotedao;
    @Autowired
    private RegistroEntradaDAO registroentradadao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private ProductoDAO productodao;
    @Autowired
    private DocumentoDAO documentodao;
    @Autowired
    private NumeracionDAO numeraciondao;
    private DecimalFormat formato = new DecimalFormat("000000");

    public void registrar(RegistroEntrada regentrada) {
        // inicio se establece el periodo



        try {
            regentrada.setIdregentrada(null);
            regentrada.setIdperiodo(periododao.buscarPorFecha(new Date()));
            regentrada.setDfecreg(new Date());
            // fin se establece el periodo

            cruddao.registrar(regentrada);

            List<Movimiento> listaMovimientos = regentrada.getMovimientoCollection();
            System.out.println("MOVIMIENTOS:" + listaMovimientos.size());
            Movimiento detalle;
            Existencia existencia;
            Producto producto;
            for (Movimiento d : listaMovimientos) {
                detalle = new Movimiento();
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(d.getIdalmacen().getIdalmacen(), d.getIdproducto().getIdproducto());
                existencia.setIdproducto(d.getIdproducto());
                existencia.setIdalmacen(regentrada.getIdalmacen());
                detalle.setIdproducto(d.getIdproducto());

                producto = productodao.busqueda(detalle.getIdproducto().getIdproducto());
                producto.setNmenudeo(detalle.getIdproducto().getNmenudeo());
                cruddao.actualizar(producto);

                detalle.setIdalmacen(regentrada.getIdalmacen());
                detalle.setIdregentrada(regentrada);
                detalle.setNvaluni(d.getNvaluni());
                detalle.setNdesfin(d.getNdesfin());
                detalle.setNdesbon(d.getNdesbon());
                detalle.setNdeslab(d.getNdeslab());
                detalle.setNsubtot(d.getNsubtot());
                detalle.setNcantidad(d.getNcantidad());
                detalle.setNcantidadm(d.getNcantidadm());
                detalle.setNcosuni(d.getNcosuni());
                detalle.setClote(d.getClote());
                detalle.setCfecven(d.getCfecven());
                detalle.setCtipmov("E");

                //SI EL MOTIVO DEL INGRESO SE COSTEA
                if (regentrada.getIdmotivo().getBcosteo()) {
                    BigDecimal neto = detalle.getNcosuni();

                    detalle.setNcosuni(neto);
                    detalle.setNdesfin(new BigDecimal(0));
                    detalle.setNdesbon(new BigDecimal(0));
                    detalle.setNdeslab(new BigDecimal(0));

                    if (detalle.getNcantidad() > 0) {
                        neto = detalle.getNsubtot().divide(new BigDecimal(detalle.getNcantidad()), 4, RoundingMode.HALF_EVEN);
                        BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                        BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                        BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);

                        BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(), new BigDecimal(detalle.getNcantidad()), neto);
                        existencia.setNcosuni(costo);
                        existencia.setNultcos(neto);
                    } else {

                        BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                        BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                        BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);


                        BigDecimal ningresofraccioningreso = new BigDecimal(detalle.getNcantidadm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                        neto = detalle.getNsubtot().divide(ningresofraccioningreso, 4, RoundingMode.HALF_EVEN);


                        BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(), ningresofraccioningreso, neto);
                        existencia.setNcosuni(costo);
                        existencia.setNultcos(neto);

                    }


                }

                existencia.setNstock(existencia.getNstock() + detalle.getNcantidad());
                existencia.setNstockm(existencia.getNstockm() + detalle.getNcantidadm());

                detalle.setNstock(existencia.getNstock());
                detalle.setNstockm(existencia.getNstockm());
                existencia.setBactivo(true);
                //Actualizo la existencia en caso de no existir se crea
                existenciadao.registrar(existencia);
                // se graba el detalle
                cruddao.registrar(detalle);
                //para todo concidero lote
                Lote lote = lotedao.buscarPorIdalmacenPorIdproductoPorCloteParaIngreso(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto(), detalle.getClote().trim());

                if (lote.getIdlote() == null) {
                    lote.setIdalmacen(d.getIdalmacen());
                    lote.setIdproducto(d.getIdproducto());
                    lote.setNstock(detalle.getNcantidad());
                    lote.setNstockm(detalle.getNcantidadm());
                    lote.setClote(detalle.getClote().trim());
                    lote.setCfecven(detalle.getCfecven().trim());
                    lote.setIdmotivo(regentrada.getIdmotivo());
                    lote.setIdusuario(regentrada.getIdusuario());
                    lote.setDfecreg(new Date());
                    lote.setDfecha(regentrada.getDfecha());
                    cruddao.registrar(lote);
                } else {
                    lote.setDfecha(regentrada.getDfecha());
                    lote.setNstock(lote.getNstock() + detalle.getNcantidad());
                    lote.setNstockm(lote.getNstockm() + detalle.getNcantidadm());
                    lote.setCfecven(detalle.getCfecven());
                    lote.setDfecreg(new Date());
                    cruddao.actualizar(lote);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }





    }

    public BigDecimal costeo(BigDecimal stockactual, BigDecimal costoactual, BigDecimal stockentrada, BigDecimal costoentrada) {
        BigDecimal sumavalorizado = stockactual.multiply(costoactual).add(stockentrada.multiply(costoentrada));
        BigDecimal sumastock = stockactual.add(stockentrada);

        if (!Numero.isCero(sumastock)) {
            BigDecimal costounitario = sumavalorizado.divide(sumastock, 4, BigDecimal.ROUND_HALF_UP);
            return costounitario;
        } else {
            return costoactual;
        }

    }

    public void eliminar(Integer idregentrada) {
        try {
            RegistroEntrada regentrada = registroentradadao.busqueda(idregentrada);
            List<Movimiento> listaIngreso = regentrada.getMovimientoCollection();
            Existencia existencia;
            for (Movimiento d : listaIngreso) {
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(d.getIdalmacen().getIdalmacen(), d.getIdproducto().getIdproducto());
                existencia.setNstock(existencia.getNstock() - d.getNcantidad());
                //////
                Lote lote = lotedao.buscarPorIdalmacenPorIdproductoPorCloteParaAnulacion(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto(), d.getClote().trim());

                if (lote.getIdlote() != null) {
                    lote.setNstock(lote.getNstock() - d.getNcantidad());
                    cruddao.actualizar(lote);
                }
                //costeo
                cruddao.actualizar(existencia);
                //eliminar movimiento
                cruddao.eliminar(d);


            }

            cruddao.eliminar(regentrada);
            CuentaPagar cuentaspagar = cuentapagardao.buscarPorIdregentrada(regentrada.getIdregentrada());

            if (cuentaspagar != null) {
                if (cuentaspagar.getNacuenta().equals(new BigDecimal("0"))) {
                    throw new ExceptionZarcillo("El documento:" + cuentaspagar.getCserie() + "-" + cuentaspagar.getCnumero() + ", tiene movimientos, Imposible anular Ingreso");
                } else {
                    cruddao.eliminar(cuentaspagar);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void transferenciaFraccion(RegistroSalida regsalida, Movimiento m) {

        try {
            RegistroSalida regsalidafraccion = new RegistroSalida();
            regsalidafraccion.setIdcliente(Cliente.TRANSFERENCIA);
            regsalidafraccion.setIdcondicion(regsalida.getIdcondicion());
            regsalidafraccion.setDfecha(regsalida.getDfecha());
            regsalidafraccion.setDfecdig(regsalida.getDfecdig());
            regsalidafraccion.setIddocumento(documentodao.buscarPorCcodigosunat(Documento.TRANSFERENCIA_SUNAT.getCcodigosunat()));
            regsalidafraccion.setIdmoneda(regsalida.getIdmoneda());
            regsalidafraccion.setIdmotivo(MotivoSalida.FRACCION);
            regsalidafraccion.setIdunidad(regsalida.getIdunidad());
            regsalidafraccion.setIdusuario(regsalida.getIdusuario());
            regsalidafraccion.setIdvendedor(regsalida.getIdvendedor());

            Numeracion numeracion = numeraciondao.incrementar(regsalidafraccion.getIdunidad().getIdunidad(), regsalidafraccion.getIddocumento().getIddocumento());
            String cnumero = formato.format(numeracion.getNnumero());
            regsalidafraccion.setCserie(numeracion.getCserie());
            regsalidafraccion.setCnumero(cnumero);


            List<Movimiento> listaMovimientoFraccionSalida = new ArrayList<>();
            Movimiento movimientoFraccionSalida = new Movimiento();
            movimientoFraccionSalida.setIdalmacen(m.getIdalmacen());
            movimientoFraccionSalida.setIdproducto(m.getIdproducto());
            movimientoFraccionSalida.setNcantidad(1);
            movimientoFraccionSalida.setNcosuni(m.getNcosuni());
            movimientoFraccionSalida.setNvaluni(m.getNcosuni());
            movimientoFraccionSalida.setNsubtot(m.getNcosuni());
            listaMovimientoFraccionSalida.add(movimientoFraccionSalida);
            regsalidafraccion.setMovimientoCollection(listaMovimientoFraccionSalida);

            super.llaves(regsalida);

            super.lotes(regsalida);


            super.registrar(regsalidafraccion);

            RegistroEntrada regentradafraccion = new RegistroEntrada();
            regentradafraccion.setDfecha(new Date());
            regentradafraccion.setIdalmacen(m.getIdalmacen());
            regentradafraccion.setIddocumento(documentodao.buscarPorCcodigosunat(Documento.TRANSFERENCIA_SUNAT.getCcodigosunat()));
            regentradafraccion.setIdmotivo(MotivoEntrada.FRACCION);
            regentradafraccion.setIdproveedor(Proveedor.TRANSFERENCIA);
            regentradafraccion.setIdusuario(regsalida.getIdusuario());


            listaMovimientoFraccionSalida = regsalida.getMovimientoCollection();

            List<Movimiento> listaMovimientoFraccionEntrada = new ArrayList<>();

            Movimiento movimiento;
            for (Movimiento ms : listaMovimientoFraccionSalida) {
                movimiento = new Movimiento();
                movimiento.setIdalmacen(ms.getIdalmacen());
                movimiento.setIdproducto(ms.getIdproducto());

                Integer nentrada = 1 * ms.getIdproducto().getNmenudeo();
                BigDecimal nstocfraccion = new BigDecimal(1).divide(new BigDecimal(ms.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                BigDecimal ncosuni = ms.getNcosuni().multiply(nstocfraccion);

                movimiento.setNcantidadm(nentrada);
                movimiento.setNcosuni(ncosuni);
                movimiento.setNsubtot(ms.getNcosuni());
                movimiento.setClote(ms.getClote());
                movimiento.setCfecven(ms.getCfecven());
                listaMovimientoFraccionEntrada.add(movimiento);
            }

            regentradafraccion.setMovimientoCollection(listaMovimientoFraccionEntrada);
            Periodo periodo = periododao.buscarPorFecha(regentradafraccion.getDfecha());
            regentradafraccion.calcula(periodo.getNigv());
            registrar(regentradafraccion);
            
            
            Transferencia transferencia=new Transferencia();
            transferencia.setDfecreg(new Date());
            transferencia.setCserie(numeracion.getCserie());
            transferencia.setCnumero(cnumero);
            transferencia.setIdusuario(regsalida.getIdusuario());
            transferencia.setIdalmacen(regentradafraccion.getIdalmacen());
            transferencia.setIdregsalida(regsalidafraccion);
            transferencia.setIdregentrada(regentradafraccion);
            cruddao.registrar(transferencia);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }




    }
}
