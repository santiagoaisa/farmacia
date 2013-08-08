package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoNotaboProveedorDAO;
import com.zarcillo.domain.MotivoNotaboProveedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoNotaboProveedor;
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
@Service("motivoNotaboProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoNotaboProveedorServiceImpl implements MotivoNotaboProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoNotaboProveedorDAO motivodao;

    @Override
    @Transactional
    public MotivoNotaboProveedor registrar(MotivoNotaboProveedor motivo) {
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
    public MotivoNotaboProveedor actualizar(MotivoNotaboProveedor motivo) {
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
    public void eliminar(MotivoNotaboProveedor motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Motivo");
        }
    }

    @Override
    public MotivoNotaboProveedor buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el motivo con id:" + idmotivo);
        }
    }

    @Override
   
    public List<MotivoNotaboProveedor> listaGeneral() {
        return cruddao.listarTodos(MotivoNotaboProveedor.class);
    }

    private void registrarLog(String cmotivo, MotivoNotaboProveedor motivo) {
        LogMotivoNotaboProveedor logmotivo = new LogMotivoNotaboProveedor();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
