package com.zarcillo.dao;

import com.zarcillo.domain.Rol;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

@Repository
public class RolDAOImpl implements RolDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Rol busqueda(Integer idrol) {
         return (Rol) em.createNamedQuery("Rol.findByIdrol").setParameter("idrol", idrol).getSingleResult();
    }

    @Override
    public List<Rol> listaGeneral() {
        return em.createNamedQuery("Rol.findAll").getResultList();
    }

    
    
}
