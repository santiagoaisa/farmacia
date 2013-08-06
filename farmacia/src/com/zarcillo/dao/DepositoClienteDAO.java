package com.zarcillo.dao;

import com.zarcillo.domain.DepositoCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DepositoClienteDAO {
     DepositoCliente buscarPorIddeposito(Integer iddeposito);
    List<DepositoCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
}
