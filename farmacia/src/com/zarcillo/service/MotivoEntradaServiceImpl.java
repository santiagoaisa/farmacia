package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoEntradaDAO;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoEntrada;
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
@Service("motivoEntradaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoEntradaServiceImpl implements MotivoEntradaService{

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoEntradaDAO motivodao;
    
    @Override
    @Transactional
    public MotivoEntrada registrar(MotivoEntrada motivo) {
        try {
            motivo.setDfecreg(new Date());
            cruddao.registrar(motivo);
              //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una MotivoEntrada");
        }
        return motivo;
    }

    @Override
    @Transactional
    public MotivoEntrada actualizar(MotivoEntrada motivo) {
        try {
            cruddao.actualizar(motivo);
              //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), motivo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una MotivoEntrada");
        }
        return motivo;
    }

    @Override
    @Transactional
    public void eliminar(MotivoEntrada motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una MotivoEntrada");
        }
    }

    @Override
    public MotivoEntrada buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la motivo con id:" + idmotivo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<MotivoEntrada> listaGeneral() {
        return cruddao.listarTodos(MotivoEntrada.class);
    }
    
     private void registrarLog(String cmotivo, MotivoEntrada motivo) {
         LogMotivoEntrada logmotivo = new LogMotivoEntrada();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
