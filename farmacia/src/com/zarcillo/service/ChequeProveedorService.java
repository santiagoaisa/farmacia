package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.ChequeProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ChequeProveedorService {
      public ChequeProveedor registrar(ChequeProveedor cheque);
    public ChequeProveedor actualizar(ChequeProveedor cheque);
    public void eliminar(ChequeProveedor cheque);
    
     public ChequeProveedor amortizar(AmortizacionProveedor amortizacion);
    public ChequeProveedor desamortizar(AmortizacionProveedor amortizacion);
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idcheque);
    
    public ChequeProveedor buscar(Integer idcheque);
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor,Integer nano);
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor,Integer nano);
}
