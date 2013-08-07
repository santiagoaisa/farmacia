package com.zarcillo.service;

import com.zarcillo.dao.ClienteDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Cliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogCliente;
import java.util.Date;
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
public class ClienteServiceImpl implements ClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ClienteDAO clientedao;

    @Override
    @Transactional
    public Cliente registrar(Cliente cliente) {
        try {
            cliente.setDfecreg(new Date());
            cruddao.registrar(cliente);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), cliente);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Cliente");
        }
        return cliente;
    }

    @Override
    @Transactional
    public Cliente actualizar(Cliente cliente) {
        try {
            cruddao.actualizar(cliente);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), cliente);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Cliente");
        }
        return cliente;
    }

    @Override
    @Transactional
    public void eliminar(Cliente cliente) {
          try {
            cruddao.eliminar(cliente);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Cliente");
        }
    }

    @Override
    public Cliente buscar(Integer idcliente) {
         try {
            return clientedao.buscarPorIdcliente(idcliente);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el cliente con id:" + idcliente);
        }
    }

    @Override
    public Cliente buscarPorIdunidadPorIdcliente(Integer idunidad, Integer idcliente) {
         try {
            return clientedao.buscarPorIdunidadPorIdcliente(idunidad, idcliente);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el cliente con id:" + idcliente);
        }
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

    private void registrarLog(String cmotivo, Cliente cliente) {
        LogCliente logcliente = new LogCliente();
        logcliente.setCmotivo(cmotivo);
        logcliente.setCobservacion(LogZarcillo.log(cliente));
        logcliente.setIdcliente(cliente);
        logcliente.setIdusuario(cliente.getIdusuario());
        logcliente.setDfecreg(new Date());
        cruddao.registrar(logcliente);
    }
}
