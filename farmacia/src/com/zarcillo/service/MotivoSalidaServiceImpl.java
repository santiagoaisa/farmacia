package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoSalidaDAO;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoSalida;
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
@Service("motivoSalidaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoSalidaServiceImpl implements MotivoSalidaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoSalidaDAO motivodao;

    @Override
    @Transactional
    public MotivoSalida registrar(MotivoSalida motivo) {
        try {
            motivo.setDfecreg(new Date());
            cruddao.registrar(motivo);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una MotivoSalida");
        }
        return motivo;
    }

    @Override
    @Transactional
    public MotivoSalida actualizar(MotivoSalida motivo) {
        try {
            cruddao.actualizar(motivo);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una MotivoSalida");
        }
        return motivo;
    }

    @Override
    @Transactional
    public void eliminar(MotivoSalida motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una MotivoSalida");
        }
    }

    @Override
    public MotivoSalida buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la motivo con id:" + idmotivo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<MotivoSalida> listaGeneral() {
        return cruddao.listarTodos(MotivoSalida.class);
    }

    private void registrarLog(String cmotivo, MotivoSalida motivo) {
        LogMotivoSalida logmotivo = new LogMotivoSalida();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
