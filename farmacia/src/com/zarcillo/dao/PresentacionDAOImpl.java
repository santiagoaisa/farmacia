package com.zarcillo.dao;

import com.zarcillo.domain.Presentacion;
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
public class PresentacionDAOImpl implements PresentacionDAO{

       @PersistenceContext
    private EntityManager em;
    
    @Override
    public Presentacion busqueda(Integer idpresentacion) {
        return (Presentacion) em.createNamedQuery("Presentacion.findByIdpresentacion").setParameter("idpresentacion", idpresentacion).getSingleResult();
    }

    @Override
    public List<Presentacion> listaGeneral() {
        return em.createNamedQuery("Presentacion.findAll").getResultList();
    }
    
    
    
    
}
