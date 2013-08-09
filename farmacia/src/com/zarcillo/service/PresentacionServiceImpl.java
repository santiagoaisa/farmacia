package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.PresentacionDAO;
import com.zarcillo.domain.Presentacion;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogPresentacion;
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
@Service("presentacionService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PresentacionServiceImpl implements PresentacionService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private PresentacionDAO presentaciondao;

    @Override
    @Transactional
    public Presentacion registrar(Presentacion presentacion) {
        try {
            presentacion.setDfecreg(new Date());
            cruddao.registrar(presentacion);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), presentacion);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Presentacion");
        }
        return presentacion;
    }

    @Override
    @Transactional
    public Presentacion actualizar(Presentacion presentacion) {
        try {
            cruddao.actualizar(presentacion);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), presentacion);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Presentacion");
        }
        return presentacion;
    }

    @Override
    @Transactional
    public void eliminar(Presentacion presentacion) {
        try {
            cruddao.eliminar(presentacion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Presentacion");
        }
    }

    @Override
    public Presentacion buscar(Integer idpresentacion) {
        try {
            return presentaciondao.busqueda(idpresentacion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la presentacion con id:" + idpresentacion);
        }
    }

    @Override
   
    public List<Presentacion> listaGeneral() {
        return presentaciondao.listaGeneral();
    }

    private void registrarLog(String cmotivo, Presentacion presentacion) {
        LogPresentacion logpresentacion = new LogPresentacion();
        logpresentacion.setCmotivo(cmotivo);
        logpresentacion.setCobservacion(LogZarcillo.log(presentacion));
        logpresentacion.setIdpresentacion(presentacion);
        logpresentacion.setIdusuario(presentacion.getIdusuario());
        logpresentacion.setDfecreg(new Date());
        cruddao.registrar(logpresentacion);
    }
}