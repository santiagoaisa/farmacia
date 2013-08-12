package com.zarcillo.dao;

import com.zarcillo.domain.Anulacion;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AnulacionDAO {
    
    List<Anulacion> listaPorFechas(Date dfecha1, Date dfecha2) ;
    
}
