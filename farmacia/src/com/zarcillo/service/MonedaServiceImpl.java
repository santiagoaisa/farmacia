package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MonedaDAO;
import com.zarcillo.domain.Moneda;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMoneda;
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
@Service("monedaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MonedaServiceImpl implements MonedaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MonedaDAO monedadao;

    @Override
    @Transactional
    public Moneda registrar(Moneda moneda) {
        try {
            moneda.setDfecreg(new Date());
            cruddao.registrar(moneda);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), moneda);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Moneda");
        }
        return moneda;
    }

    @Override
    @Transactional
    public Moneda actualizar(Moneda moneda) {
        try {
            cruddao.actualizar(moneda);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), moneda);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Moneda");
        }
        return moneda;
    }

    @Override
    @Transactional
    public void eliminar(Moneda moneda) {
        try {
            cruddao.eliminar(moneda);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Moneda");
        }
    }

    @Override
    public Moneda buscar(Integer idmoneda) {
        try {
            return monedadao.busqueda(idmoneda);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la moneda con id:" + idmoneda);
        }
    }

    @Override
   
    public List<Moneda> listaGeneral() {
        return monedadao.listaGeneral();
    }
    
     private void registrarLog(String cmotivo, Moneda moneda) {
         LogMoneda logmoneda = new LogMoneda();
        logmoneda.setCmotivo(cmotivo);
        logmoneda.setCobservacion(LogZarcillo.log(moneda));
        logmoneda.setIdmoneda(moneda);
        logmoneda.setIdusuario(moneda.getIdusuario());
        logmoneda.setDfecreg(new Date());
        cruddao.registrar(logmoneda);
    }
}
