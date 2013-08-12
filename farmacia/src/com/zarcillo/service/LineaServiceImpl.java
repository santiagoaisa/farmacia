package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LineaDAO;
import com.zarcillo.domain.Linea;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogLinea;
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
@Service("lineaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class LineaServiceImpl implements LineaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private LineaDAO lineadao;

    @Override
    @Transactional
    public Linea registrar(Linea linea) {
        try {
            linea.setDfecreg(new Date());
            cruddao.registrar(linea);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), linea);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Linea");
        }
        return linea;
    }

    @Override
    @Transactional
    public Linea actualizar(Linea linea) {
        try {
            cruddao.actualizar(linea);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), linea);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Linea");
        }
        return linea;
    }

    @Override
    @Transactional
    public void eliminar(Linea linea) {
        try {
            cruddao.eliminar(linea);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Linea");
        }
    }

    @Override
    public Linea buscar(Integer idlinea) {
        try {
            return lineadao.busqueda(idlinea);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la linea con id:" + idlinea);
        }
    }

    @Override
   
    public List<Linea> listaGeneral() {
        return lineadao.listaGeneral();
    }

    private void registrarLog(String cmotivo, Linea linea) {
        LogLinea loglinea = new LogLinea();
        loglinea.setCmotivo(cmotivo);
        loglinea.setCobservacion(LogZarcillo.log(linea));
        loglinea.setIdlinea(linea);
        loglinea.setIdusuario(linea.getIdusuario());
        loglinea.setDfecreg(new Date());
        cruddao.registrar(loglinea);
    }

    @Override
    public List<Linea> listaActivos() {
        return lineadao.listaActivos();
    }

    @Override
    public List<Linea> listaConStock(Integer idalmacen) {
        return lineadao.listaConStock(idalmacen);
    }
    
    
    
    
    
}
