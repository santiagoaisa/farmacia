package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ComprobanteEmitidoService {    
    public ComprobanteEmitido buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunidad,Integer iddocumento,String cserie, String cnumero);
    public ComprobanteEmitido buscarPorIdregsalida(Integer idregsalida);    
    public ComprobanteEmitido buscarPorIdcomprobante(Integer idcomprobante);    
    public ComprobanteEmitido amortizar(AmortizacionCliente amortizacion);
    public ComprobanteEmitido desamortizar(AmortizacionCliente amortizacion);
    public List<AmortizacionCliente> listaAmortizaciones(Integer idcomprobante);    
    public List<ComprobanteEmitido> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano);
    
}
