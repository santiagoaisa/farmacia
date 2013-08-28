package com.zarcillo.dao;

import com.zarcillo.domain.Movimiento;
import java.util.Date;
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

    @Override
    public List<Movimiento> listaPorIdunidadPorFechasVenta(Integer idunidad, Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("Movimiento.findByIdunidadByDfechasByVenta").setParameter("idunidad", idunidad).setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }
    
    
}
