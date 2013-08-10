package com.zarcillo.negocio;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.RegistroEntradaDAO;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.service.ExceptionZarcillo;
import java.math.BigDecimal;
import java.math.RoundingMode;
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

    public void registrar(RegistroEntrada regentrada) {
        // inicio se establece el periodo

        regentrada.setIdperiodo(periododao.buscarPorFecha(new Date()));
        // fin se establece el periodo
        cruddao.registrar(regentrada);

        List<Movimiento> listaMovimientos = regentrada.getMovimientoCollection();

        Movimiento detalle;
        Existencia existencia;
        for (Movimiento d : listaMovimientos) {
            detalle = new Movimiento();
            existencia = existenciadao.buscarPorIdalmacenPorIdproducto(d.getIdalmacen().getIdalmacen(), d.getIdproducto().getIdproducto());
            existencia.setIdproducto(d.getIdproducto());
            existencia.setIdalmacen(regentrada.getIdalmacen());
            detalle.setIdproducto(d.getIdproducto());

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
                neto = detalle.getNsubtot().divide(new BigDecimal(detalle.getNcantidad()), 4, RoundingMode.HALF_EVEN);
                detalle.setNcosuni(neto);
                detalle.setNdesfin(new BigDecimal(0));
                detalle.setNdesbon(new BigDecimal(0));
                detalle.setNdeslab(new BigDecimal(0));

                if (detalle.getNcantidad() != 0) {
                    BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                    BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(existencia.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                    BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);


                    BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(), new BigDecimal(detalle.getNcantidad()), neto);
                    existencia.setNcosuni(costo);
                    existencia.setNultcos(detalle.getNcosuni());
                } else {

                    BigDecimal nstockentero = new BigDecimal(existencia.getNstock());
                    BigDecimal nstocfraccion = new BigDecimal(existencia.getNstockm()).divide(new BigDecimal(existencia.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);
                    BigDecimal nstocktotalactual = nstockentero.add(nstocfraccion);

                    BigDecimal nstockfraccion=new BigDecimal(detalle.getNcantidadm()).divide(new BigDecimal(existencia.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_EVEN);

                    BigDecimal costo = costeo(nstocktotalactual, existencia.getNcosuni(),nstocfraccion , neto);
                    existencia.setNcosuni(costo);
                    existencia.setNultcos(detalle.getNcosuni());

                }


            }

            existencia.setNstock(existencia.getNstock() + detalle.getNcantidad());
            existencia.setNstock(existencia.getNstockm() + detalle.getNcantidadm());

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
                lote.setDfecreg(regentrada.getDfecreg());
                lote.setDfecha(regentrada.getDfecha());
                cruddao.registrar(lote);
            } else {
                lote.setDfecha(regentrada.getDfecha());
                lote.setNstock(lote.getNstock() + detalle.getNcantidad());
                lote.setNstockm(lote.getNstockm() + detalle.getNcantidadm());
                lote.setCfecven(detalle.getCfecven());
                cruddao.actualizar(lote);
            }
        }


    }

    public BigDecimal costeo(BigDecimal stockactual, BigDecimal costoactual, BigDecimal stockentrada, BigDecimal costoentrada) {
        BigDecimal suma = stockactual.add(stockentrada);
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
}
