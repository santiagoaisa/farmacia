package com.zarcillo.service;

import com.zarcillo.domain.NotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarProveedorService {
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
}
