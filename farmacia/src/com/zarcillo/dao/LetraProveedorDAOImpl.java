package com.zarcillo.dao;

import com.zarcillo.domain.LetraProveedor;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class LetraProveedorDAOImpl implements LetraProveedorDAO{
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public LetraProveedor buscarPorIdletra(Integer idletra) {
        return (LetraProveedor) em.createNamedQuery("LetraProveedor.findByIdletra").setParameter("idletra", idletra).getSingleResult();
    }
    
    
}
