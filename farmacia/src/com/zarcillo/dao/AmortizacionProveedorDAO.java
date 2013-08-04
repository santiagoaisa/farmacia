package com.zarcillo.dao;

import com.zarcillo.domain.AmortizacionProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AmortizacionProveedorDAO {
    List<AmortizacionProveedor> listaPorIdcuenta(Integer idcuenta);
}
