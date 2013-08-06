package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.NotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboProveedorService {
    
      public NotaboProveedor buscarPorIdnotabo(Integer idnotabo);   
    
    public NotaboProveedor registrar(NotaboProveedor notabo);
    public NotaboProveedor actualizar(NotaboProveedor notabo);
    public void eliminar(NotaboProveedor notabo);
    
    public NotaboProveedor amortizar(AmortizacionProveedor amortizacion);
    public NotaboProveedor desamortizar(AmortizacionProveedor amortizacion);
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idnotabo);
    
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad,Integer idproveedor,Integer nano);
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad,Integer idproveedor,Integer nano);
}
