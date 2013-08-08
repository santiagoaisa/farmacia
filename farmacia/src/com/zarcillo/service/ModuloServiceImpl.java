package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.ModuloDAO;
import com.zarcillo.domain.Modulo;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogModulo;
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
@Service("moduloService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ModuloServiceImpl implements ModuloService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ModuloDAO modulodao;

    @Override
    @Transactional
    public Modulo registrar(Modulo modulo) {
        try {
            modulo.setDfecreg(new Date());
            cruddao.registrar(modulo);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), modulo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Modulo");
        }
        return modulo;
    }

    @Override
    @Transactional
    public Modulo actualizar(Modulo modulo) {
        try {
            cruddao.actualizar(modulo);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), modulo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Modulo");
        }
        return modulo;
    }

    @Override
    @Transactional
    public void eliminar(Modulo modulo) {
        try {
            cruddao.eliminar(modulo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Modulo");
        }
    }

    @Override
    public Modulo buscar(Integer idmodulo) {
        try {
            return modulodao.busqueda(idmodulo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el modulo con id:" + idmodulo);
        }
    }

    @Override
   
    public List<Modulo> listaGeneral() {
        return cruddao.listarTodos(Modulo.class);
    }

    @Override
    
    public List<Modulo> listaPorIdrol(Integer idrol) {
        return modulodao.listaPorIdrol(idrol);
    }
    
    
    

    private void registrarLog(String cmotivo, Modulo modulo) {
        LogModulo logmodulo = new LogModulo();
        logmodulo.setCmotivo(cmotivo);
        logmodulo.setCobservacion(LogZarcillo.log(modulo));
        logmodulo.setIdmodulo(modulo);
        logmodulo.setIdusuario(modulo.getIdusuario());
        logmodulo.setDfecreg(new Date());
        cruddao.registrar(logmodulo);
    }
}
