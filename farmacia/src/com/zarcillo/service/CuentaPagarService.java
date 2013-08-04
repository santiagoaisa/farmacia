package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CuentaPagarService {
    public CuentaPagar buscarPorIdcuenta(Integer idcuenta);
    public CuentaPagar buscarPorIdregentrada(Integer idregentrada);
    
    public CuentaPagar registrar(CuentaPagar cuentapagar);
    public CuentaPagar actualizar(CuentaPagar cuentapagar);
    public void eliminar(CuentaPagar cuentapagar);
    
    public CuentaPagar amortizar(AmortizacionProveedor amortizacion);
    public CuentaPagar desamortizar(AmortizacionProveedor amortizacion);
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idcuenta);
    
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
}
