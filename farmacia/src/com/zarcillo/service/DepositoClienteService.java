package com.zarcillo.service;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.DepositoCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DepositoClienteService {
    
    public DepositoCliente registrar(DepositoCliente deposito);
    public DepositoCliente actualizar(DepositoCliente deposito);
    public void eliminar(DepositoCliente deposito);
    
     public DepositoCliente amortizar(AmortizacionCliente amortizacion);
    public DepositoCliente desamortizar(AmortizacionCliente amortizacion);
    public List<AmortizacionCliente> listaAmortizaciones(Integer iddeposito);
    
    public DepositoCliente buscarPorIddeposito(Integer iddeposito);
    public List<DepositoCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
