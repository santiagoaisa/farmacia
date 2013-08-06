package com.zarcillo.dao;

import com.zarcillo.domain.NotcarCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotcarClienteDAO {
     NotcarCliente buscarPorIdnotabo(Integer idnotcar);
    List<NotcarCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
