package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.RolDAO;
import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Rol;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogRol;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("rolService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RolServiceImpl implements RolService {

    @Autowired
    private RolDAO roldao;
    @Autowired
    private CrudDAO cruddao;

    @Override
    @Transactional
    public Rol registrar(Rol rol) {
        try {
            rol.setDfecreg(new Date());
            cruddao.registrar(rol);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), rol);
            //LOG
            
           
            
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Rol");
        }
        return rol;
    }

    @Override
    @Transactional
    public Rol actualizar(Rol rol) {
          try {
            cruddao.actualizar(rol);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), rol);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Rol");
        }
        return rol;
    }

    @Override
    @Transactional
    public void eliminar(Rol rol) {
         try {
            cruddao.eliminar(rol);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Rol");
        }
    }

    @Override
    public Rol buscar(Integer idrol) {
         try {
            return roldao.busqueda(idrol);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el rol con id:" + idrol);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Rol> listaGeneral() {
          return cruddao.listarTodos(Rol.class);
    }

    private void registrarLog(String cmotivo, Rol rol) {
        LogRol logrol = new LogRol();
        logrol.setCmotivo(cmotivo);
        logrol.setCobservacion(LogZarcillo.log(rol));
        logrol.setIdrol(rol);
        logrol.setDfecreg(new Date());
        cruddao.registrar(logrol);
    }
}
