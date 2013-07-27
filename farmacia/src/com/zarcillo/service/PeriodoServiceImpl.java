package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.Periodo;
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
@Service("periodoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PeriodoServiceImpl implements PeriodoService{

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private PeriodoDAO periododao;
    
    @Override
    @Transactional
    public Periodo registrar(Periodo periodo) {
        try {
            periodo.setDfecreg(new Date());
            cruddao.registrar(periodo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Periodo");
        }
        return periodo;
    }

    @Override
    @Transactional
    public Periodo actualizar(Periodo periodo) {
        try {
            cruddao.actualizar(periodo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Periodo");
        }
        return periodo;
    }

    @Override
    @Transactional
    public void eliminar(Periodo periodo) {
        try {
            cruddao.eliminar(periodo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Periodo");
        }
    }

    @Override
    public Periodo buscar(Integer idperiodo) {
        try {
            return periododao.busqueda(idperiodo);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la periodo con id:" + idperiodo);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Periodo> listaGeneral() {
        return cruddao.listarTodos(Periodo.class);
    }
    
}
