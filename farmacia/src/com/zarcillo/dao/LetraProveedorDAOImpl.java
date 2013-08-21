package com.zarcillo.dao;

import com.zarcillo.domain.LetraProveedor;
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
public class LetraProveedorDAOImpl implements LetraProveedorDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public LetraProveedor buscarPorIdletra(Integer idletra) {
        return (LetraProveedor) em.createNamedQuery("LetraProveedor.findByIdletra").setParameter("idletra", idletra).getSingleResult();
    }

    @Override
    public List<LetraProveedor> listaPendientesPorFechasPendientes(Date dfecha1,Date dfecha2) {
        return em.createNamedQuery("LetraProveedor.findByDfecvenPendientes").setParameter("dfecha1", dfecha1).setParameter("dfecha2",dfecha2).getResultList();
    }
}
