package com.zarcillo.dao;

import com.zarcillo.domain.DepositoProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DepositoProveedorDAO {
    DepositoProveedor buscarPorIddeposito(Integer iddeposito);    
    List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
}
