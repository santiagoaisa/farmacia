package com.zarcillo.dao;

import com.zarcillo.domain.BarraHerramienta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class BarraHerramientaDAOImpl implements BarraHerramientaDAO{
    
    @PersistenceContext
    private EntityManager em;

    @Override
    public BarraHerramienta busqueda(Integer idbarra) {
        return (BarraHerramienta) em.createNamedQuery("BarraHerramienta.findByIdbarra").setParameter("idbarra", idbarra).getSingleResult();
    }

    
    
    @Override
    public List<BarraHerramienta> listaGeneral() {
        return em.createNamedQuery("BarraHerramienta.findAll").getResultList();
    }
    
    
    
}
