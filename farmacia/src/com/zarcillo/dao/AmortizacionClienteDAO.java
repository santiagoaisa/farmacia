package com.zarcillo.dao;

import com.zarcillo.domain.AmortizacionCliente;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AmortizacionClienteDAO {
    List<AmortizacionCliente> listaPorFechas(Date fecha1,Date fecha2,List<Integer> lista);
    List<AmortizacionCliente> listaPorIdcomprobante(Integer idcomprobante);
    List<AmortizacionCliente> listaPorIddeposito(Integer iddeposito);
    List<AmortizacionCliente> listaPorIdcheque(Integer idcheque);
    List<AmortizacionCliente> listaPorIdnotabo(Integer idnotabo);
    List<AmortizacionCliente> listaPorIdnotcar(Integer idnotcar);
    List<AmortizacionCliente> listaPorIdretencion(Integer idretencion);
}
