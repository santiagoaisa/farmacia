package com.zarcillo.service;

import com.zarcillo.domain.Cliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ClienteService {
    
      public Cliente registrar(Cliente cliente);
    public Cliente actualizar(Cliente cliente);
    public void eliminar(Cliente cliente);
    public Cliente buscar(Integer idcliente);
    public Cliente buscarPorIdunidadPorIdcliente(Integer idunidad, Integer idcliente);
    public List<Cliente> listaPorIdunidad(Integer idunidad);
      public List<Cliente> busquedaListaPorIdunidadPorCnomcli(Integer idunidad, String cnomcli);
    
}
