package com.zarcillo.service;

import com.zarcillo.domain.CuentaPagar;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CuentaPagarService {
    public CuentaPagar registrar(CuentaPagar cuentapagar);
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(String idunidad,String idproveedor,Integer nano);
}
