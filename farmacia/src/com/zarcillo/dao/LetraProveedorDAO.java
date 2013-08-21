package com.zarcillo.dao;

import com.zarcillo.domain.LetraProveedor;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LetraProveedorDAO {
    LetraProveedor buscarPorIdletra(Integer idletra);    
    List<LetraProveedor> listaPendientesPorFechasPendientes(Date dfecha1,Date fecha2);
}
