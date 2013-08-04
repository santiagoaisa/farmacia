package com.zarcillo.dao;

import com.zarcillo.domain.NotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarProveedorDAO {
    NotcarProveedor busqueda(Integer idnotcar);
    List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    
}
