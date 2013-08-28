
package com.zarcillo.dao;

import com.zarcillo.domain.LetraCliente;
import java.util.Date;
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
public class LetraClienteDAOImpl implements LetraClienteDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public LetraCliente buscarPorIdletra(Integer idletra) {
        return (LetraCliente) em.createNamedQuery("LetraCliente.findByIdletra").setParameter("idletra", idletra).getSingleResult();
    }

    @Override
    public List<LetraCliente> listaPendientesPorFechasPendientes(Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("LetraCliente.findByDfechasPendientes").setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }
    
    
    
    
}
