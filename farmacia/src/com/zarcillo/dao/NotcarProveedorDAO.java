package com.zarcillo.dao;

import com.zarcillo.domain.NotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarProveedorDAO {
    NotcarProveedor buscarPorIdnotcar(Integer idnotcar);
    List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
    
}
