package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.NotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarProveedorService {
    
      public NotcarProveedor buscarPorIdnotcar(Integer idnotcar);   
    
    public NotcarProveedor registrar(NotcarProveedor notcar);
    public NotcarProveedor actualizar(NotcarProveedor notcar);
    public void eliminar(NotcarProveedor notcar);
    
    public NotcarProveedor amortizar(AmortizacionProveedor amortizacion);
    public NotcarProveedor desamortizar(AmortizacionProveedor amortizacion);
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idnotcar);
    
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
    
}
