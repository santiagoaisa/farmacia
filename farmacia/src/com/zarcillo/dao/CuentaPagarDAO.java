package com.zarcillo.dao;

import com.zarcillo.domain.CuentaPagar;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CuentaPagarDAO {
    CuentaPagar buscarPorIdregentrada(Integer idregentrada);    
    CuentaPagar buscarPorIdcuenta(Integer idcuenta);    
    List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(String idunidad,String idproveedor,Integer nano);
}
