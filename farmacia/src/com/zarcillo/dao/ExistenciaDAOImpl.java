package com.zarcillo.dao;

import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class ExistenciaDAOImpl implements ExistenciaDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public void registrar(Existencia existencia) {
        Existencia e = em.find(Existencia.class, existencia.getExistenciaPK());

        if (e == null) {
            em.persist(existencia);
        } else {
            em.merge(existencia);
        }

    }

    @Override
    public Existencia buscarPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto) {
        Existencia existencia;
        try {
            existencia = (Existencia) em.createNamedQuery("Existencia.findByIdalmacenByIdproducto").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getSingleResult();
        } catch (NoResultException e) {
            existencia = new Existencia(idalmacen, idproducto);
        }

        return existencia;
    }
}
