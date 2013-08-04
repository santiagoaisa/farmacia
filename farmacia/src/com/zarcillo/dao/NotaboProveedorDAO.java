package com.zarcillo.dao;

import com.zarcillo.domain.NotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboProveedorDAO {
    NotaboProveedor busqueda(Integer idnotabo);
    List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
}
