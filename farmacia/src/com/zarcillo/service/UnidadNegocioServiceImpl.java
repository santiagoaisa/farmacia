package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.UnidadNegocioDAO;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogUnidadNegocio;
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
@Service("unidadNegocioService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UnidadNegocioServiceImpl implements UnidadNegocioService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private UnidadNegocioDAO unidaddao;

    @Override
    @Transactional
    public UnidadNegocio registrar(UnidadNegocio unidad) {
        try {
            unidad.setDfecreg(new Date());
            cruddao.registrar(unidad);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), unidad);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Unidad de Negocio");
        }
        return unidad;
    }

    @Override
    @Transactional
    public UnidadNegocio actualizar(UnidadNegocio unidad) {
        try {
            cruddao.actualizar(unidad);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), unidad);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Unidad de Negocio");
        }
        return unidad;
    }

    @Override
    @Transactional
    public void eliminar(UnidadNegocio unidad) {
        try {
            cruddao.eliminar(unidad);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Unidad de Negocio");
        }
    }

    @Override
    public UnidadNegocio buscar(Integer idunidad) {
        try {
            return unidaddao.busqueda(idunidad);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la Unidad de Negocio con id:" + idunidad);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<UnidadNegocio> listaGeneral() {
        return cruddao.listarTodos(UnidadNegocio.class);
    }

    private void registrarLog(String cmotivo, UnidadNegocio unidad) {
        ////LOG
        LogUnidadNegocio logunidad = new LogUnidadNegocio();
        logunidad.setCmotivo(cmotivo);
        logunidad.setCobservacion(LogZarcillo.log(unidad));
        logunidad.setIdunidad(unidad);;
        logunidad.setIdusuario(unidad.getIdusuario());
        logunidad.setDfecreg(new Date());
        cruddao.registrar(logunidad);
        ////LOG
    }
}
