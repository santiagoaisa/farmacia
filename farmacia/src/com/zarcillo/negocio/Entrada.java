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
            existencia = existenciadao.buscarPorIdalmacenPorIdproducto(d.getExistencia().getIdalmacen().getIdalmacen(), d.getExistencia().getIdproducto().getIdproducto());
            existencia.setIdproducto(d.getExistencia().getIdproducto());
            existencia.setIdalmacen(regentrada.getIdalmacen());
            detalle.setIdregentrada(regentrada);
            detalle.setNvaluni(d.getNvaluni());
            detalle.setNdesfin(d.getNdesfin());
            detalle.setNdesbon(d.getNdesbon());
            detalle.setNdeslab(d.getNdeslab());
            detalle.setNsubtot(d.getNsubtot());
            detalle.setExistencia(existencia);
            detalle.setNcantidad(d.getNcantidad());
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

                BigDecimal costo = costeo(existencia.getNstock(), existencia.getNcosuni(), detalle.getNcantidad(), neto);
                existencia.setNcosuni(costo);
                existencia.setNultcos(detalle.getNcosuni());
            }

            existencia.setNstock(existencia.getNstock() + detalle.getNcantidad());
            detalle.setNstock(existencia.getNstock());
            existencia.setBactivo(true);
            //Actualizo la existencia en caso de no existir se crea
            existenciadao.registrar(existencia);
            // se graba el detalle
            cruddao.registrar(detalle);
            //para todo concidero lote
            Lote lote = lotedao.buscarPorIdalmacenPorIdproductoPorClote(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto(), detalle.getClote().trim());

            if (lote.getIdlote() == null) {
                lote.setExistencia(existencia);
                lote.setNstock(detalle.getNstock());
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
                lote.setCfecven(detalle.getCfecven());
                cruddao.actualizar(lote);
            }
        }


    }

    public BigDecimal costeo(Integer stockactual, BigDecimal costoactual, Integer stockentrada, BigDecimal costoentrada) {
        Integer suma = stockactual + stockentrada;
        BigDecimal sumavalorizado = BigDecimal.valueOf(stockactual).multiply(costoactual).add(BigDecimal.valueOf(stockentrada).multiply(costoentrada));
        BigDecimal sumastock = BigDecimal.valueOf(stockactual + stockentrada);

        if (suma > 0) {
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
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(d.getExistencia().getIdalmacen().getIdalmacen(), d.getExistencia().getIdproducto().getIdproducto());
                existencia.setNstock(existencia.getNstock() - d.getNcantidad());
                //////
                Lote lote = lotedao.buscarPorIdalmacenPorIdproductoPorClote(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto(), d.getClote().trim());
                lote.setNstock(lote.getNstock() - d.getNcantidad());
                cruddao.actualizar(lote);
                //costeo
                cruddao.actualizar(existencia);
                
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
