package com.zarcillo.service;

import com.zarcillo.dao.BarraHerramientaDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.BarraHerramienta;
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
@Service("barraHerramientaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BarraHerramientaServiceImpl implements BarraHerramientaService{

     @Autowired
    private CrudDAO cruddao;
    @Autowired
    private BarraHerramientaDAO barradao;
    
    @Override
    @Transactional
    public BarraHerramienta registrar(BarraHerramienta barra) {
        try {
            barra.setDfecreg(new Date());
            cruddao.registrar(barra);            

        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Barra de Herramienta");
        }
        return barra;
    }

    @Override
     @Transactional
    public BarraHerramienta actualizar(BarraHerramienta barra) {
           try {
            cruddao.actualizar(barra);
            
        } catch (Exception e) {
             throw new ExceptionZarcillo("Error al actualizar una Barra de Herramienta");
        }
        return barra;
    }

    @Override
     @Transactional
    public void eliminar(BarraHerramienta barra) {
         try {
            cruddao.eliminar(barra);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Barra de Herramienta");
        }
    }

    @Override
    public BarraHerramienta buscar(Integer idbarra) {
        try {
            return barradao.busqueda(idbarra);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite una Barra de Herramienta con id:" + idbarra);
        }
    }

    @Override
    public List<BarraHerramienta> listaGeneral() {
        return barradao.listaGeneral();
    }
    
    
    
}
