package com.zarcillo.dao;

import com.zarcillo.domain.CuentaPagar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CuentaPagarDAO {
    CuentaPagar buscarPorIdregentrada(Integer idregentrada);    
    CuentaPagar buscarPorIdcuenta(Integer idcuenta);    
    List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
    List<CuentaPagar> listaPendientesHasta(Date dhasta);
}
