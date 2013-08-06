package com.zarcillo.dao;

import com.zarcillo.domain.AmortizacionProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AmortizacionProveedorDAO {
    List<AmortizacionProveedor> listaPorIdcuenta(Integer idcuenta);
    List<AmortizacionProveedor> listaPorIddeposito(Integer iddeposito);
    List<AmortizacionProveedor> listaPorIdcheque(Integer idcheque);
    List<AmortizacionProveedor> listaPorIdnotabo(Integer idnotabo);
    List<AmortizacionProveedor> listaPorIdnotcar(Integer idnotcar);
}
