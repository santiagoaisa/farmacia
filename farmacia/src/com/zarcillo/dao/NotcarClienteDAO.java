package com.zarcillo.dao;

import com.zarcillo.domain.NotcarCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarClienteDAO {
     NotcarCliente buscarPorIdnotcar(Integer idnotcar);
    List<NotcarCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
