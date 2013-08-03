package com.zarcillo.dao;

import com.zarcillo.domain.Acceso;
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
public class AccesoDAOImpl implements AccesoDAO{
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public List<Acceso> listaPorIdusuario(Integer idusuario) {
        return em.createNamedQuery("Acceso.findByIdusuario").setParameter("idusuario", idusuario).getResultList();
    }
    
    
    
}
