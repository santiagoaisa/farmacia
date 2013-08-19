package com.zarcillo.service;

import com.zarcillo.dao.ClienteDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.TipoPersonaDAO;
import com.zarcillo.dao.UbigeoDAO;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.TipoPersona;
import com.zarcillo.domain.Ubigeo;
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
    @Autowired
    private TipoPersonaDAO  tipopersonadao;
    @Autowired
    private UbigeoDAO ubigeodao;

    @Override
    @Transactional
    public Cliente registrarClienteVenta(Cliente cliente) {
        try {
            //boleta            
            if(cliente.getCruc()==null && cliente.getCdni()==null){
                throw new ExceptionZarcillo("El cliente no tiene documento de identidad rebice por favor");
            }
            
            TipoPersona tipo_persona_natural=tipopersonadao.buscarPorCcodigoSunat(TipoPersona.NATURAL_SUNAT.getCcodigosunat());
            TipoPersona tipo_persona_juridica=tipopersonadao.buscarPorCcodigoSunat(TipoPersona.JURIDICA_SUNAT.getCcodigosunat());
            
            if(cliente.getCdni()!=null ){
                if(!cliente.getCdni().isEmpty()){
                    cliente.setIdtipo(tipo_persona_natural);
                }                
            }
            
            
            if(cliente.getCruc()!=null ){
                if(!cliente.getCruc().isEmpty()){
                    String cadena=cliente.getCruc().substring(0, 1);
                    if(cadena.contains("2")){
                        cliente.setIdtipo(tipo_persona_juridica);
                    }else{
                        cliente.setIdtipo(tipo_persona_natural);
                    }
                }
            }
            
            
            cliente.setIdubigeo(ubigeodao.buscarPorIdubigeo(Ubigeo.AREQUIPA.getIdubigeo()));
            cliente.setDfecreg(new Date());
            cruddao.registrar(cliente);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
        
        return clientedao.buscarPorIdcliente(cliente.getIdcliente());
    }

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
    public Cliente buscarPorCdni(String cdni) {
        try {
            return clientedao.buscarPorCdni(cdni);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo("No existe un cliente con DNI:"+cdni);
        }
        
    }

    @Override
    public Cliente buscarPorCruc(String cruc) {
        try {
            return clientedao.buscarPorCruc(cruc);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo("No existe un cliente con RUC:"+cruc);
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
    public List<Cliente> listaPorIdunidad(Integer idunidad) {
        return clientedao.listaPorIdunidad(idunidad);
    }

    @Override
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