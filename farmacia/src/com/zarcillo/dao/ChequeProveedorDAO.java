package com.zarcillo.dao;

import com.zarcillo.domain.ChequeProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ChequeProveedorDAO {
    ChequeProveedor busqueda(Integer idcheque);
    List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
}
