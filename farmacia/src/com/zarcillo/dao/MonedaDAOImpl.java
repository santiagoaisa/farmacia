package com.zarcillo.dao;

import com.zarcillo.domain.Moneda;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class MonedaDAOImpl implements MonedaDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public Moneda busqueda(Integer idmoneda) {
        return (Moneda) em.createNamedQuery("Moneda.findByIdmoneda").setParameter("idmoneda", idmoneda).getSingleResult();
    }

    @Override
    public List<Moneda> listaGeneral() {
        return em.createNamedQuery("Moneda.findAll").getResultList();
    }
    
    
    
    
}
