package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MonedaDAO;
import com.zarcillo.domain.Moneda;
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
    @Transactional(readOnly = true)
    public List<Moneda> listaGeneral() {
        return cruddao.listarTodos(Moneda.class);
    }
}
