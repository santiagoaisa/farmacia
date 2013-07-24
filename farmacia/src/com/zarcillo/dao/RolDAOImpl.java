package com.zarcillo.dao;

import com.zarcillo.domain.Rol;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class RolDAOImpl implements RolDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void registrar(Rol rol) {
        em.persist(rol);
    }

    @Override
    public List<Rol> lista() {
        List<Rol> lista = em.createNamedQuery("Rol.findAll").getResultList();
        //em.createNamedQuery("Rol.findAll").getResultList();
        return lista;
    }
}
