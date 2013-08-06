package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.RetencionCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RetencionClienteService {

     public RetencionCliente buscarPorIdretencion(Integer idretencion);   
    
    public RetencionCliente registrar(RetencionCliente retencion);
    public RetencionCliente actualizar(RetencionCliente retencion);
    public void eliminar(RetencionCliente retencion);
    
    public RetencionCliente amortizar(AmortizacionCliente amortizacion);
    public RetencionCliente desamortizar(AmortizacionCliente amortizacion);
    public List<AmortizacionCliente> listaAmortizaciones(Integer idretencion);
    
    public List<RetencionCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    public List<RetencionCliente> listaPorIdunidadPorIdperiodo(Integer idunidad,Integer idperiodo);

}
