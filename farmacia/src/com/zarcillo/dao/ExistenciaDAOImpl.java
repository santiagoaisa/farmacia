package com.zarcillo.dao;

import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;
import java.util.List;
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

    @Override
    public List<Existencia> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen, String ccriterio) {
        return em.createNamedQuery("Existencia.findByIdalmacenByCnomproducto").setParameter("idalmacen", idalmacen).setParameter("ccriterio", ccriterio.trim().toUpperCase().concat("%")).getResultList();
    }

    @Override
    public List<Existencia> listaPorIdalmacenPorBinafecto(Integer idalmacen) {
        return em.createNamedQuery("Existencia.findByIdalmacenByBinafecto").setParameter("idalmacen", idalmacen).getResultList();
    }

    @Override
    public List<Existencia> listaPorIdalmacenPorIdlinea(Integer idalmacen, Integer idlinea) {
        return em.createNamedQuery("Existencia.findByIdalmacenByIdlinea").setParameter("idalmacen", idalmacen).setParameter("idlinea", idlinea).getResultList();
    }

    @Override
    public List<Existencia> listaPorIdalmacenPorLineasConStock(Integer idalmacen, List<Integer> lista) {
        return em.createNamedQuery("Existencia.findByIdalmacenByIdlineaByNstock").setParameter("idalmacen", idalmacen).setParameter("lista",lista).getResultList();
    }
    
    
    
}
