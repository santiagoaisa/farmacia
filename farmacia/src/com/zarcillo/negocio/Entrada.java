package com.zarcillo.negocio;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.ProductoDAO;
import com.zarcillo.dao.RegistroEntradaDAO;
import com.zarcillo.dao.RegistroSalidaDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.Anulacion;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.DetalleAnulacion;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.MotivoAnulacion;
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
import com.zarcillo.domain.Usuario;
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
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private AmortizacionClienteDAO amortizacionclientedao;
    @Autowired
    private AmortizacionProveedorDAO amortizacionproveedordao;
    @Autowired
    private MovimientoDAO movimientodao;
    @Autowired
    private RegistroSalidaDAO regsalidadao;
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
                    //SI LA CANTIDAD INGRESADA ES ENTERA
                    if (detalle.getNcantidad() > 0) {
                        //NETO DIVISION ENTRE EL SUBTOTAL Y LA CANTIDAD INGRESADA
                        neto = detalle.getNsubtot().divide(new BigDecimal(detalle.getNcantidad()), 4, RoundingMode.HALF_EVEN);
                        //STOCK ACTUAL QUE TENEMOS EN ENTERO Y FRACCION
                        BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                        BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                        BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);

                        BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(), new BigDecimal(detalle.getNcantidad()), neto);
                        existencia.setNultcosuni(existencia.getNcosuni());
                        existencia.setNcosuni(costo);
                        existencia.setNultcos(neto);
                    } else {

                        BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                        BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                        BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);


                        BigDecimal ningresofraccioningreso = new BigDecimal(detalle.getNcantidadm()).divide(new BigDecimal(producto.getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                        neto = detalle.getNsubtot().divide(ningresofraccioningreso, 4, RoundingMode.HALF_EVEN);


                        BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(), ningresofraccioningreso, neto);
                        existencia.setNultcosuni(existencia.getNcosuni());
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
            regsalidafraccion.setIddocumento(Documento.TRANSFERENCIA);
            regsalidafraccion.setIdmoneda(regsalida.getIdmoneda());
            regsalidafraccion.setIdmotivo(MotivoSalida.TRANSFERENCIA);
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

            super.llaves(regsalidafraccion);

            super.lotes(regsalidafraccion);
            super.llaves(regsalidafraccion);
            super.registrar(regsalidafraccion);

            RegistroEntrada regentradafraccion = new RegistroEntrada();
            regentradafraccion.setDfecha(new Date());
            regentradafraccion.setIdalmacen(m.getIdalmacen());
            regentradafraccion.setIddocumento(Documento.TRANSFERENCIA);
            regentradafraccion.setCserie(numeracion.getCserie());
            regentradafraccion.setCnumero(cnumero);
            regentradafraccion.setIdmotivo(MotivoEntrada.TRANSFERENCIA);
            regentradafraccion.setIdproveedor(Proveedor.TRANSFERENCIA);
            regentradafraccion.setIdusuario(regsalida.getIdusuario());


            List<Movimiento> listaMovimientoSalida = movimientodao.listaPorIdregsalida(regsalidafraccion.getIdregsalida());


            List<Movimiento> listaMovimientoFraccionEntrada = new ArrayList<>();

            Movimiento movimiento;
            for (Movimiento ms : listaMovimientoSalida) {
                movimiento = new Movimiento();
                movimiento.setIdalmacen(ms.getIdalmacen());
                movimiento.setIdproducto(ms.getIdproducto());
                //ENTRADA DE FRACCION
                Integer nentradafraccion = 1 * ms.getIdproducto().getNmenudeo();
                // EL STOCK QUE REPRESENTA 1 UNIDAD EN FRACCION EJEMPLO 0.01
                BigDecimal nstocfraccion = new BigDecimal("1").divide(new BigDecimal(ms.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                // EL STOCK ENFRACCION ME SIRVE PARA SACAR EL COSTO FRACCIONADO
                BigDecimal ncosuni = ms.getNcosuni().multiply(nstocfraccion);
                movimiento.setNcantidadm(nentradafraccion);
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


            Transferencia transferencia = new Transferencia();
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

    public void anular(RegistroEntrada regentrada) {
        try {
            CuentaPagar cuentaPagar = cuentapagardao.buscarPorIdregentrada(regentrada.getIdregentrada());
            List<AmortizacionProveedor> listaAmortizacion = amortizacionproveedordao.listaPorIdcuenta(cuentaPagar.getIdcuenta());

            if (listaAmortizacion.size() > 0) {
                throw new ExceptionZarcillo("Imposible eliminar Ingreso la Factura de Proveedor" + cuentaPagar.getCserie() + "-" + cuentaPagar.getCnumero() + " tiene amortizaciones imposible eliminar");
            }

            List<Movimiento> listaMovimientos = movimientodao.listaPorIdregentrada(regentrada.getIdregentrada());
            Existencia existencia;
            Lote lote;
            for (Movimiento m : listaMovimientos) {
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());
                existencia.setNstock(existencia.getNstock() - m.getNcantidad());
                existencia.setNstockm(existencia.getNstockm() - m.getNcantidadm());
                cruddao.actualizar(existencia);

                lote = lotedao.buscarPorIdalmacenPorIdproductoPorCloteParaAnulacion(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto(), m.getClote());

                if (lote.getIdlote() == null) {
                } else {
                    lote.setNstock(lote.getNstock() - m.getNstock());
                    lote.setNstockm(lote.getNstockm() - m.getNstockm());
                    lote.setDfecreg(new Date());
                    cruddao.actualizar(lote);
                }

                cruddao.eliminar(m);
            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }

    }

    public void anular(RegistroSalida regsalida, MotivoAnulacion motivo, Usuario usuario) {
        try {
            if (regsalida.getBanulado()) {
                throw new ExceptionZarcillo("El documento Ya fue anulado");
            }
            if (regsalida.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado\n imposible eliminar ");
            }

            Periodo periodo = periododao.buscarPorFecha(new Date());
            // SIEMPRE SE ELIMINA EL DOCUMENTO
            ComprobanteEmitido comprobante = comprobantedao.buscarPorIdregsalida(regsalida.getIdregsalida());
            List<AmortizacionCliente> listaAmortizacion = amortizacionclientedao.listaPorIdcomprobante(comprobante.getIdcomprobante());

            for (AmortizacionCliente a : listaAmortizacion) {
                if (a.getBregistro()) {
                    throw new ExceptionZarcillo("Imposible anular la amortizacion ya fue reportada en CAJA");
                }

                cruddao.eliminar(a);
            }


            Anulacion anulacion = new Anulacion();
            anulacion.setNidregsalida(regsalida.getIdregsalida());
            anulacion.setIdcliente(regsalida.getIdcliente());
            anulacion.setIdcondicion(regsalida.getIdcondicion());
            anulacion.setIddocumento(regsalida.getIddocumento());
            anulacion.setIdmotivo(regsalida.getIdmotivo());
            anulacion.setIdunidad(regsalida.getIdunidad());
            anulacion.setIdusuario(usuario);
            anulacion.setIdvendedor(regsalida.getIdvendedor());
            anulacion.setCserie(regsalida.getCserie());
            anulacion.setCnumero(regsalida.getCnumero());
            anulacion.setCsergui(regsalida.getCsergui());
            anulacion.setCnumgui(regsalida.getCnumgui());
            anulacion.setDfecha(new Date());
            anulacion.setDfecreg(new Date());
            anulacion.setDfecemi(regsalida.getDfecha());
            anulacion.setIdperiodo(periodo);

            anulacion.setNafecto(regsalida.getNafecto());
            anulacion.setNinafecto(regsalida.getNinafecto());
            anulacion.setNfleven(regsalida.getNfleven());
            anulacion.setNigv(regsalida.getNigv());
            anulacion.setNimporte(regsalida.getNimporte());
            anulacion.setNplazo(regsalida.getNplazo());
            anulacion.setIdmotanu(motivo);
            anulacion.setIdusuario(usuario);
            anulacion.setNcosto(regsalida.getNcosto());
            anulacion.setIdmoneda(regsalida.getIdmoneda());
            anulacion.setNtipocambio(regsalida.getNtipocambio());
            cruddao.registrar(anulacion);

            List<Movimiento> listaMovimientos = movimientodao.listaPorIdregsalida(regsalida.getIdregsalida());

            DetalleAnulacion detalleanulacion;
            Existencia existencia;
            Lote lote;
            for (Movimiento m : listaMovimientos) {
                /////// detalle de anulacion
                detalleanulacion = new DetalleAnulacion();
                detalleanulacion.setIdanulacion(anulacion);
                detalleanulacion.setIdalmacen(m.getIdalmacen());
                detalleanulacion.setIdproducto(m.getIdproducto());
                detalleanulacion.setNidregsalida(m.getIdregsalida().getIdregsalida());
                detalleanulacion.setBinafecto(m.getBinafecto());
                detalleanulacion.setCfecven(m.getCfecven());
                detalleanulacion.setClote(m.getClote());
                detalleanulacion.setNcantidad(m.getNcantidad());
                detalleanulacion.setNcantidadm(m.getNcantidadm());
                detalleanulacion.setNmenudeo(m.getNmenudeo());
                detalleanulacion.setNorden(m.getNorden());
                detalleanulacion.setNcosuni(m.getNcosuni());
                detalleanulacion.setNdesfin(m.getNdesfin());
                detalleanulacion.setNdeslab(m.getNdeslab());
                detalleanulacion.setNdesbon(m.getNdesbon());
                detalleanulacion.setNsubtot(m.getNsubtot());
                detalleanulacion.setNvaluni(m.getNvaluni());
                detalleanulacion.setIdanulacion(anulacion);
                detalleanulacion.setCtipmov(m.getCtipmov());
                cruddao.registrar(detalleanulacion);

                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());
                existencia.setNstock(existencia.getNstock() + m.getNcantidad());
                existencia.setNstockm(existencia.getNstockm() + m.getNcantidadm());
                cruddao.actualizar(existencia);

                lote = lotedao.buscarPorIdalmacenPorIdproductoPorCloteParaAnulacion(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto(), m.getClote());

                if (lote.getIdlote() == null) {
                    lote.setIdalmacen(m.getIdalmacen());
                    lote.setIdproducto(m.getIdproducto());
                    lote.setIdusuario(usuario);
                    lote.setIdmotivo(MotivoEntrada.ANULACION);
                    lote.setClote(m.getClote());
                    lote.setCfecven(m.getCfecven());
                    lote.setCobservacion("ANULACION " + regsalida.getIddocumento().getCabrev() + ":" + regsalida.getCserie() + "-" + regsalida.getCnumero());
                    lote.setNstock(m.getNcantidad());
                    lote.setNstockm(m.getNcantidadm());
                    lote.setDfecreg(new Date());
                    cruddao.registrar(lote);
                } else {
                    lote.setNstock(lote.getNstock() + m.getNcantidad());
                    lote.setNstockm(lote.getNstockm() + m.getNcantidadm());
                    lote.setDfecreg(new Date());
                    cruddao.actualizar(lote);
                }

                cruddao.eliminar(m);
            }


            cruddao.eliminar(regsalida);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }
}
