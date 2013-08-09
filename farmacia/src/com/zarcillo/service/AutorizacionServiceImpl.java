package com.zarcillo.service;

import com.zarcillo.dao.AutorizacionDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Autorizacion;
import com.zarcillo.domain.Aval;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogAutorizacion;
import com.zarcillo.log.LogAval;
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
@Service("autorizacionService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AutorizacionServiceImpl implements AutorizacionService{
    
     @Autowired
    private CrudDAO cruddao;
    @Autowired
    private AutorizacionDAO autorizaciondao;

    @Override
     @Transactional
    public Autorizacion registrar(Autorizacion autorizacion) {
        try {
            autorizacion.setDfecreg(new Date());
            cruddao.registrar(autorizacion);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), autorizacion);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Autorizacion");
        }
        return autorizacion;
    }

    @Override
     @Transactional    
    public Autorizacion actualizar(Autorizacion autorizacion) {
          try {
            cruddao.actualizar(autorizacion);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), autorizacion);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Autorizacion");
        }
        return autorizacion;
    }

    @Override
     @Transactional
    public void eliminar(Autorizacion autorizacion) {
          try {
            cruddao.eliminar(autorizacion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Autorizacion");
        }
    }

    @Override
    public Autorizacion buscar(Integer idautorizacion) {
         try {
            return autorizaciondao.busqueda(idautorizacion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite una autorizacion con id:" + idautorizacion);
        }
    }

    @Override
   
    public List<Autorizacion> listaGeneral() {
         return autorizaciondao.listaGeneral();
    }
    
      private void registrarLog(String cmotivo, Autorizacion autorizacion) {
          LogAutorizacion logautorizacion = new LogAutorizacion();
        logautorizacion.setCmotivo(cmotivo);
        logautorizacion.setCobservacion(LogZarcillo.log(autorizacion));
        logautorizacion.setIdautorizacion(autorizacion);
        logautorizacion.setIdusuario(autorizacion.getIdusuario());
        logautorizacion.setDfecreg(new Date());
        cruddao.registrar(logautorizacion);
    }
    
}
