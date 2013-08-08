package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoNotaboClienteDAO;
import com.zarcillo.domain.MotivoNotaboCliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoNotaboCliente;
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
@Service("motivoNotaboClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoNotaboClienteServiceImpl implements MotivoNotaboClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoNotaboClienteDAO motivodao;

    @Override
    @Transactional
    public MotivoNotaboCliente registrar(MotivoNotaboCliente motivo) {
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
    public MotivoNotaboCliente actualizar(MotivoNotaboCliente motivo) {
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
    public void eliminar(MotivoNotaboCliente motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Motivo");
        }
    }

    @Override
    public MotivoNotaboCliente buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el motivo con id:" + idmotivo);
        }
    }

    @Override
   
    public List<MotivoNotaboCliente> listaGeneral() {
        return cruddao.listarTodos(MotivoNotaboCliente.class);
    }

    private void registrarLog(String cmotivo, MotivoNotaboCliente motivo) {
        LogMotivoNotaboCliente logmotivo = new LogMotivoNotaboCliente();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
