
package com.zarcillo.dao;

import com.zarcillo.domain.LetraCliente;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class LetraClienteDAOImpl implements LetraClienteDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public LetraCliente buscarPorIdletra(Integer idletra) {
        return (LetraCliente) em.createNamedQuery("LetraCliente.findByIdletra").setParameter("idletra", idletra).getSingleResult();
    }
    
    
    
}
