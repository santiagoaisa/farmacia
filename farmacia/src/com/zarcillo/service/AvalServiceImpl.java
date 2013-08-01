package com.zarcillo.service;

import com.zarcillo.dao.AvalDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Aval;
import com.zarcillo.estado.MotivoLog;
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
@Service("avalService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AvalServiceImpl implements AvalService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private AvalDAO avaldao;

    @Override
    @Transactional
    public Aval registrar(Aval aval) {
        try {
            aval.setDfecreg(new Date());
            cruddao.registrar(aval);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), aval);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Aval");
        }
        return aval;
    }

    @Override
    @Transactional
    public Aval actualizar(Aval aval) {
        try {
            cruddao.actualizar(aval);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), aval);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Aval");
        }
        return aval;
    }

    @Override
    @Transactional
    public void eliminar(Aval aval) {
        try {
            cruddao.eliminar(aval);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Aval");
        }
    }

    @Override  
    public Aval buscar(Integer idaval) {
        try {
            return avaldao.busqueda(idaval);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un aval con id:" + idaval);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Aval> listaPorIdcliente(Integer idcliente) {
        return avaldao.listaPorIdcliente(idcliente);
    }

    private void registrarLog(String cmotivo, Aval aval) {
        LogAval logaval = new LogAval();
        logaval.setCmotivo(cmotivo);
        logaval.setCobservacion(LogZarcillo.log(aval));
        logaval.setIdaval(aval);
        logaval.setIdusuario(aval.getIdusuario());
        logaval.setDfecreg(new Date());
        cruddao.registrar(logaval);
    }
}
