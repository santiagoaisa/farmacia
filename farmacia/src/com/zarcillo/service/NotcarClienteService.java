package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.NotcarCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarClienteService {
    
     public NotcarCliente buscarPorIdnotcar(Integer idnotcar);   
    
    public NotcarCliente registrar(NotcarCliente notcar);
    public NotcarCliente actualizar(NotcarCliente notcar);
    public void eliminar(NotcarCliente notcar);
    
    public NotcarCliente amortizar(AmortizacionCliente amortizacion);
    public NotcarCliente desamortizar(AmortizacionCliente amortizacion);
    public List<AmortizacionCliente> listaAmortizaciones(Integer idnotcar);
    
    public List<NotcarCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
