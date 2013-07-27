package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.FamiliaDAO;
import com.zarcillo.domain.Familia;
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
@Service("familiaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class FamiliaServiceImpl implements FamiliaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private FamiliaDAO familiadao;

    @Override
    @Transactional
    public Familia registrar(Familia familia) {
        try {
            familia.setDfecreg(new Date());
            cruddao.registrar(familia);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Familia");
        }
        return familia;
    }

    @Override
    @Transactional
    public Familia actualizar(Familia familia) {
        try {
            cruddao.actualizar(familia);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Familia");
        }
        return familia;
    }

    @Override
    @Transactional
    public void eliminar(Familia familia) {
        try {
            cruddao.eliminar(familia);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Familia");
        }
    }

    @Override
    public Familia buscar(Integer idfamilia) {
        try {
            return familiadao.busqueda(idfamilia);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la familia con id:" + idfamilia);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Familia> listaGeneral() {
        return cruddao.listarTodos(Familia.class);
    }
}
