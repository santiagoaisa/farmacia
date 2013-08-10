package com.zarcillo.dao;

import com.zarcillo.domain.Aval;
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
public class AvalDAOImpl implements AvalDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public Aval busqueda(Integer idaval) {
        return (Aval) em.createNamedQuery("Aval.findByIdaval").setParameter("idaval", idaval).getSingleResult();                
    }

    @Override
    public List<Aval> listaPorIdcliente(Integer idcliente) {
        return em.createNamedQuery("Aval.findByIdcliente").setParameter("idcliente", idcliente).getResultList();
    }
}
