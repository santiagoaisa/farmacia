package com.zarcillo.dao;

import com.zarcillo.domain.Movimiento;
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
public class MovimientoDAOImpl implements MovimientoDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Movimiento> listaPorIdregsalida(Integer idregsalida) {
        return em.createNamedQuery("Movimiento.findByIdregsalida").setParameter("idregsalida", idregsalida).getResultList();
    }

    @Override
    public List<Movimiento> listaPorIdregentrada(Integer idregentrada) {
        return em.createNamedQuery("Movimiento.findByIdregentrada").setParameter("idregentrada", idregentrada).getResultList();
    }
}
