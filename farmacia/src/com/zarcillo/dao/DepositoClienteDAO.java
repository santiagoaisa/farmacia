package com.zarcillo.dao;

import com.zarcillo.domain.DepositoCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DepositoClienteDAO {
     DepositoCliente busqueda(Integer iddeposito);
    List<DepositoCliente> listaPorIdcliente(Integer idcliente);
}
