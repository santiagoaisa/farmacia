package com.zarcillo.dao;

import com.zarcillo.domain.Familia;
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
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Familia busqueda(Integer idfamilia) {
        return (Familia) em.createNamedQuery("Familia.findByIdfamilia").setParameter("idfamilia", idfamilia).getSingleResult();
    }
    
}
