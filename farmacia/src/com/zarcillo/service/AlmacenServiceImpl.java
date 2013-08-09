package com.zarcillo.service;

import com.zarcillo.dao.AlmacenDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Almacen;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogAlmacen;
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
@Service("almacenService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AlmacenServiceImpl implements AlmacenService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private AlmacenDAO almacendao;

    @Override
    @Transactional
    public Almacen registrar(Almacen almacen) {
        try {
            almacen.setDfecreg(new Date());
            cruddao.registrar(almacen);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), almacen);
            //LOG

        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Almacen");
        }
        return almacen;
    }

    @Override
    @Transactional
    public Almacen actualizar(Almacen almacen) {
        try {
            cruddao.actualizar(almacen);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), almacen);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Almacen");
        }
        return almacen;
    }

    @Override
    @Transactional
    public void eliminar(Almacen almacen) {
        try {
            cruddao.eliminar(almacen);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Almacen");
        }
    }

    @Override
    public Almacen buscar(Integer idalmacen) {
        try {
            return almacendao.busqueda(idalmacen);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el almacen con id:" + idalmacen);
        }
    }

    @Override
   
    public List<Almacen> listaGeneral() {
        return almacendao.listaGeneral();
    }

    @Override
   
    public List<Almacen> listaPorClogin(String clogin) {
        return almacendao.listaPorClogin(clogin);
    }
    
    
    

    private void registrarLog(String cmotivo, Almacen almacen) {        
        LogAlmacen logalmacen = new LogAlmacen();
        logalmacen.setCmotivo(cmotivo);
        logalmacen.setCobservacion(LogZarcillo.log(almacen));
        logalmacen.setIdalmacen(almacen);
        logalmacen.setIdusuario(almacen.getIdusuario());
        logalmacen.setDfecreg(new Date());
        cruddao.registrar(logalmacen);        
    }
}
