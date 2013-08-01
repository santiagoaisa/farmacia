package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.TipoPagoDAO;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogTipoPago;
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
@Service("tipoPagoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TipoPagoServiceImpl implements TipoPagoService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private TipoPagoDAO tipopagodao;

    @Override
    @Transactional
    public TipoPago registrar(TipoPago tipo) {
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
    public TipoPago actualizar(TipoPago tipo) {
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
    public void eliminar(TipoPago tipo) {
        try {
            cruddao.eliminar(tipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Tipo");
        }
    }

    @Override
    public TipoPago buscar(Integer idtipo) {
        try {
            return tipopagodao.busqueda(idtipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el tipo con id:" + idtipo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<TipoPago> listaGeneral() {
        return cruddao.listarTodos(TipoPago.class);
    }

    private void registrarLog(String cmotivo, TipoPago tipo) {
        LogTipoPago logtipo = new LogTipoPago();
        logtipo.setCmotivo(cmotivo);
        logtipo.setCobservacion(LogZarcillo.log(tipo));
        logtipo.setIdtipo(tipo);
        logtipo.setIdusuario(tipo.getIdusuario());
        logtipo.setDfecreg(new Date());
        cruddao.registrar(logtipo);
    }
}
