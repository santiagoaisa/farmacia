package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MotivoNotcarProveedorDAO;
import com.zarcillo.domain.MotivoNotaboProveedor;
import com.zarcillo.domain.MotivoNotcarProveedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMotivoNotcarProveedor;
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
@Service("motivoNotcarProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MotivoNotcarProveedorServiceImpl implements MotivoNotcarProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MotivoNotcarProveedorDAO motivodao;

    @Override
    @Transactional
    public MotivoNotcarProveedor registrar(MotivoNotcarProveedor motivo) {
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
    public MotivoNotcarProveedor actualizar(MotivoNotcarProveedor motivo) {
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
    public void eliminar(MotivoNotcarProveedor motivo) {
        try {
            cruddao.eliminar(motivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Motivo");
        }
    }

    @Override
    public MotivoNotcarProveedor buscar(Integer idmotivo) {
        try {
            return motivodao.busqueda(idmotivo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el motivo con id:" + idmotivo);
        }
    }

    @Override
   
    public List<MotivoNotcarProveedor> listaGeneral() {
        return cruddao.listarTodos(MotivoNotcarProveedor.class);
    }

    private void registrarLog(String cmotivo, MotivoNotcarProveedor motivo) {
        LogMotivoNotcarProveedor logmotivo = new LogMotivoNotcarProveedor();
        logmotivo.setCmotivo(cmotivo);
        logmotivo.setCobservacion(LogZarcillo.log(motivo));
        logmotivo.setIdmotivo(motivo);
        logmotivo.setIdusuario(motivo.getIdusuario());
        logmotivo.setDfecreg(new Date());
        cruddao.registrar(logmotivo);
    }
}
