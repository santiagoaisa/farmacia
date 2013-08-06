package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.NotaboCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboClienteService {
    
       public NotaboCliente buscarPorIdnotabo(Integer idnotabo);   
    
    public NotaboCliente registrar(NotaboCliente notabo);
    public NotaboCliente actualizar(NotaboCliente notabo);
    public void eliminar(NotaboCliente notabo);
    
    public NotaboCliente amortizar(AmortizacionCliente amortizacion);
    public NotaboCliente desamortizar(AmortizacionCliente amortizacion);
    public List<AmortizacionCliente> listaAmortizaciones(Integer idnotabo);
    
    public List<NotaboCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
