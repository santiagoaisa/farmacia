package com.zarcillo.dao;

import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoClienteDAO {
    
      List<Date> listaFechasCronogramaCobro(Date dfecha1,Date dfecha2);
}
