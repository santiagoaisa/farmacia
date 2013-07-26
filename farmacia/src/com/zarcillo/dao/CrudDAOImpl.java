package com.zarcillo.dao;

import java.io.Serializable;
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
public class CrudDAOImpl implements CrudDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public <T> void registrar(T objeto) {
        em.persist(objeto);
    }

    @Override
    public <T> void actualizar(T objeto) {
        em.merge(objeto);
    }

    @Override
    public <T> void eliminar(T objeto) {
        em.remove(em.merge(objeto));
    }

    @Override
    public <T> List<T> listarTodos(Class<T> klass) {
        return em.createNamedQuery(klass.getSimpleName() + ".findAll").getResultList();
    }

    @Override
    public <T> T buscar(Class<T> klass, Integer id) {
        return em.find(klass, id);
    }
}
