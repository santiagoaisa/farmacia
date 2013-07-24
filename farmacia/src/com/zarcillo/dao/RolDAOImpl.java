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

    public void registrar(Rol rol) {
        em.persist(rol);
    }

    public List<Rol> lista() {
        List<Rol> lista = em.createQuery("SELECT r FROM Rol r").getResultList();
        //em.createNamedQuery("Rol.findAll").getResultList();
        return lista;
    }
}
