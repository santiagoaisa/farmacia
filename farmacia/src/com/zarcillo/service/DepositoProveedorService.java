package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.DepositoProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DepositoProveedorService {
    
    public DepositoProveedor buscarPorIddeposito(Integer iddeposito);   
    
    public DepositoProveedor registrar(DepositoProveedor deposito);
    public DepositoProveedor actualizar(DepositoProveedor deposito);
    public void eliminar(DepositoProveedor deposito);
    
    public DepositoProveedor amortizar(AmortizacionProveedor amortizacion);
    public DepositoProveedor desamortizar(AmortizacionProveedor amortizacion);
    public List<AmortizacionProveedor> listaAmortizaciones(Integer iddeposito);
    
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
    
}
