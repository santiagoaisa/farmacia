package com.zarcillo.dao;

import com.zarcillo.domain.Periodo;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class PeriodoDAOImpl implements PeriodoDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public Periodo busqueda(Integer idperiodo) {
        return (Periodo) em.createNamedQuery("Periodo.findByIdperiodo").setParameter("idperiodo", idperiodo).getSingleResult();
        
    }
    
    
    
}
