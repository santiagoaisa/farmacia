package com.zarcillo.dao;

import com.zarcillo.domain.Autorizacion;
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
public class AutorizacionDAOImpl implements AutorizacionDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Autorizacion busqueda(Integer idautorizacion) {
        return (Autorizacion) em.createNamedQuery("Autorizacion.findByIdautorizacion").setParameter("idautorizacion", idautorizacion).getSingleResult();
    }

    @Override
    public List<Autorizacion> listaGeneral() {
        return em.createNamedQuery("Autorizacion.findAll").getResultList();
    }
    
    
    
}
