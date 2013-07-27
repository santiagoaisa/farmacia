package com.zarcillo.dao;

import com.zarcillo.domain.Cliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ClienteDAO {
      Cliente busqueda(Integer idcliente);
      Cliente buscarPorIdunidadPorIdcliente(Integer idunidad,Integer idcliente);
      List<Cliente> listaPorIdunidad(Integer idunidad);
      List<Cliente> busquedaListaPorIdunidadPorCnomcli(Integer idunidad, String cnomcli);
}
