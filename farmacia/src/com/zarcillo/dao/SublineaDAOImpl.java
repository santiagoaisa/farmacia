package com.zarcillo.dao;

import com.zarcillo.domain.Sublinea;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class SublineaDAOImpl implements SublineaDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Sublinea busqueda(Integer idsublinea) {
        return (Sublinea) em.createNamedQuery("Sublinea.findByIdsublinea").setParameter("idsublinea", idsublinea).getSingleResult();
    }
   
    
    
}
