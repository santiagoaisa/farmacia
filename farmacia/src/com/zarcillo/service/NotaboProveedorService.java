package com.zarcillo.service;

import com.zarcillo.domain.NotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboProveedorService {
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
}
