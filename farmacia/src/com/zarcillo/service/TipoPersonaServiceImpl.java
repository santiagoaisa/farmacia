package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.TipoPersonaDAO;
import com.zarcillo.domain.TipoPersona;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogTipoPersona;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Repository
public class TipoPersonaServiceImpl implements TipoPersonaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private TipoPersonaDAO tipopersonadao;

    @Override
    public TipoPersona registrar(TipoPersona tipo) {
        try {
            tipo.setDfecreg(new Date());
            cruddao.registrar(tipo);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), tipo);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Tipo de Persona");
        }
        return tipo;
    }

    @Override
    public TipoPersona actualizar(TipoPersona tipo) {
        try {
            cruddao.actualizar(tipo);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), tipo);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Tipo de Persona");
        }
        return tipo;
    }

    @Override
    public void eliminar(TipoPersona tipo) {
        try {
            cruddao.eliminar(tipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Tipo de Persona");
        }
    }

    @Override
    public TipoPersona buscar(Integer idtipo) {
        try {
            return tipopersonadao.busqueda(idtipo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el Tipo de Persona con id:" + idtipo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<TipoPersona> listaGeneral() {
        return cruddao.listarTodos(TipoPersona.class);
    }

    private void registrarLog(String cmotivo, TipoPersona tipo) {
        LogTipoPersona logtipo = new LogTipoPersona();
        logtipo.setCmotivo(cmotivo);
        logtipo.setCobservacion(LogZarcillo.log(tipo));
        logtipo.setIdtipo(tipo);
        logtipo.setIdusuario(tipo.getIdusuario());
        logtipo.setDfecreg(new Date());
        cruddao.registrar(logtipo);
    }
    
    
}
