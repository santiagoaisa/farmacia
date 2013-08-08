package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoNotcarClienteDAO;
import com.zarcillo.domain.MotivoNotcarCliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoNotcarCliente;
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
@Service("motivoNotcarClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoNotcarClienteServiceImpl implements MotivoNotcarClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoNotcarClienteDAO motivodao;

    @Override
    @Transactional
    public MotivoNotcarCliente registrar(MotivoNotcarCliente motivo) {
        try {
            motivo.setDfecreg(new Date());
            cruddao.registrar(motivo);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Motivo");
        }
        return motivo;
    }

    @Override
    @Transactional
    public MotivoNotcarCliente actualizar(MotivoNotcarCliente motivo) {
        try {
            cruddao.actualizar(motivo);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Motivo");
        }
        return motivo;
    }

    @Override
    @Transactional
    public void eliminar(MotivoNotcarCliente motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Motivo");
        }
    }

    @Override
    public MotivoNotcarCliente buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el motivo con id:" + idmotivo);
        }
    }

    @Override
   
    public List<MotivoNotcarCliente> listaGeneral() {
        return cruddao.listarTodos(MotivoNotcarCliente.class);
    }

    private void registrarLog(String cmotivo, MotivoNotcarCliente motivo) {
        LogMotivoNotcarCliente logmotivo = new LogMotivoNotcarCliente();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
