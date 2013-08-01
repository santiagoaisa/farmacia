package com.zarcillo.service;

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
    public DepositoCliente buscar(Integer iddeposito);
    public List<DepositoCliente> listaPorIdcliente(Integer idcliente);
    
}
