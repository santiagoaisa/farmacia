package com.zarcillo.dao;

import com.zarcillo.domain.NotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboProveedorDAO {
    NotaboProveedor buscarPorIdnotabo(Integer idnotabo);
    List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
}
