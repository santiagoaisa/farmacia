package com.zarcillo.dao;

import com.zarcillo.domain.RetencionCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RetencionClienteDAO {
    RetencionCliente buscarPorIdunidadPorCseriePorCnumero(Integer idunidad,String cserie, String cnumero);
    RetencionCliente buscarPorIdretencion(Integer idretencion);
    List<RetencionCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad,Integer idcliente,Integer nano);
    List<RetencionCliente> listaPorIdunidadPorIdperiodo(Integer idunidad,Integer idperiodo);
    
}
