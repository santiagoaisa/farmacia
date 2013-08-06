package com.zarcillo.dao;

import com.zarcillo.domain.NotaboCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface NotaboClienteDAO {
    NotaboCliente buscarPorIdnotabo(Integer idnotabo);
    List<NotaboCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    
}
