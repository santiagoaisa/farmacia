package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.SublineaDAO;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogSublinea;
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
@Service("sublineaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SublineaServiceImpl implements SublineaService {

    @Autowired
    private SublineaDAO sublinedao;
    @Autowired
    private CrudDAO cruddao;

    @Override
    @Transactional
    public Sublinea registrar(Sublinea sublinea) {
        try {
            sublinea.setDfecreg(new Date());
            cruddao.registrar(sublinea);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), sublinea);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Sublinea");
        }
        return sublinea;
    }

    @Override
    @Transactional
    public Sublinea actualizar(Sublinea sublinea) {
        try {
            cruddao.actualizar(sublinea);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), sublinea);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar la Sublinea");
        }
        return sublinea;
    }

    @Override
    @Transactional
    public void eliminar(Sublinea sublinea) {
        try {
            cruddao.eliminar(sublinea);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Sublinea");
        }
    }

    @Override
    public Sublinea buscar(Integer idsublinea) {
        try {
            return sublinedao.busqueda(idsublinea);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite al sublinea con id:" + idsublinea);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Sublinea> listaGeneral() {
        return cruddao.listarTodos(Sublinea.class);
    }

    private void registrarLog(String cmotivo, Sublinea sublinea) {
        LogSublinea logsublinea = new LogSublinea();
        logsublinea.setCmotivo(cmotivo);
        logsublinea.setCobservacion(LogZarcillo.log(sublinea));
        logsublinea.setIdsublinea(sublinea);
        logsublinea.setDfecreg(new Date());
        cruddao.registrar(logsublinea);
    }
}
