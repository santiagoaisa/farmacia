package com.zarcillo.dao;

import com.zarcillo.domain.Autorizacion;
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

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Autorizacion busqueda(Integer idautorizacion) {
        return (Autorizacion) em.createNamedQuery("Autorizacion.findByIdautorizacion").setParameter("idautorizacion", idautorizacion).getSingleResult();
    }
}
