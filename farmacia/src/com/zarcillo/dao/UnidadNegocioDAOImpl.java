package com.zarcillo.dao;

import com.zarcillo.domain.UnidadNegocio;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class UnidadNegocioDAOImpl implements UnidadNegocioDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public UnidadNegocio busqueda(Integer idunidad) {
        return (UnidadNegocio) em.createNamedQuery("UnidadNegocio.findByIdunidad").setParameter("idunidad", idunidad).getSingleResult();
    }
    
}
