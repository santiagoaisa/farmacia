package com.zarcillo.dao;

import com.zarcillo.domain.CondicionVenta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CondicionVentaDAO {
     CondicionVenta busqueda(Integer idcondicion);
     List<CondicionVenta> listaGeneral();
     
}
