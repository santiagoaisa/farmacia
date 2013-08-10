package com.zarcillo.dao;

import com.zarcillo.domain.Familia;
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
public class FamiliaDAOImpl  implements FamiliaDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public Familia busqueda(Integer idfamilia) {
        return (Familia) em.createNamedQuery("Familia.findByIdfamilia").setParameter("idfamilia", idfamilia).getSingleResult();
    }

    @Override
    public List<Familia> listaGeneral() {
        return em.createNamedQuery("Familia.findAll").getResultList();
    }
    
    
    
}
