package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.TipoCuentaBancariaDAO;
import com.zarcillo.domain.TipoCuentaBancaria;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogTipoCuentaBancaria;
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
@Service("tipoCuentaBancariaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TipoCuentaBancariaServiceImpl implements TipoCuentaBancariaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private TipoCuentaBancariaDAO tipopagodao;

    @Override
    @Transactional
    public TipoCuentaBancaria registrar(TipoCuentaBancaria tipo) {
        try {
            tipo.setDfecreg(new Date());
            cruddao.registrar(tipo);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), tipo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Tipo");
        }
        return tipo;
    }

    @Override
    @Transactional
    public TipoCuentaBancaria actualizar(TipoCuentaBancaria tipo) {
        try {
            cruddao.actualizar(tipo);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), tipo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Tipo");
        }
        return tipo;
    }

    @Override
    @Transactional
    public void eliminar(TipoCuentaBancaria tipo) {
        try {
            cruddao.eliminar(tipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Tipo");
        }
    }

    @Override
    public TipoCuentaBancaria buscar(Integer idtipo) {
        try {
            return tipopagodao.busqueda(idtipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el tipo con id:" + idtipo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<TipoCuentaBancaria> listaGeneral() {
        return cruddao.listarTodos(TipoCuentaBancaria.class);
    }

    private void registrarLog(String cmotivo, TipoCuentaBancaria tipo) {
        LogTipoCuentaBancaria logtipo = new LogTipoCuentaBancaria();
        logtipo.setCmotivo(cmotivo);
        logtipo.setCobservacion(LogZarcillo.log(tipo));
        logtipo.setIdtipo(tipo);
        logtipo.setIdusuario(tipo.getIdusuario());
        logtipo.setDfecreg(new Date());
        cruddao.registrar(logtipo);
    }
}
