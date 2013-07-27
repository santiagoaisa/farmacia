package com.zarcillo.service;

import com.zarcillo.dao.ClienteDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Cliente;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("clienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ClienteServiceImpl implements ClienteService{
    
     @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ClienteDAO clientedao;

    @Override
    @Transactional
    public Cliente registrar(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public Cliente actualizar(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void eliminar(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cliente buscar(Integer idcliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Cliente buscarPorIdunidadPorIdcliente(Integer idunidad, Integer idcliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional(readOnly = true)
    public List<Cliente> listaPorIdunidad(Integer idunidad) {
        return clientedao.listaPorIdunidad(idunidad);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Cliente> busquedaListaPorIdunidadPorCnomcli(Integer idunidad, String cnomcli) {
        return clientedao.busquedaListaPorIdunidadPorCnomcli(idunidad, cnomcli);
    }
    
    

  
    
    
}
