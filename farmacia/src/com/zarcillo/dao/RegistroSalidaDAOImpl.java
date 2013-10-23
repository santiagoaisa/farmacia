package com.zarcillo.dao;

import com.zarcillo.domain.RegistroSalida;
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
public class RegistroSalidaDAOImpl implements RegistroSalidaDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public RegistroSalida buscarPorIdregsalida(Integer idregsalida) {
        return (RegistroSalida) em.createNamedQuery("RegistroSalida.findByIdregsalida").setParameter("idregsalida", idregsalida).getSingleResult();
    }

    @Override
    public RegistroSalida buscarPorIdunidadIdregsalida(Integer idunidad, Integer idregsalida) {
        return (RegistroSalida) em.createNamedQuery("RegistroSalida.findByIdunidadByIdregsalida").setParameter("idunidad", idunidad).setParameter("idregsalida", idregsalida).getSingleResult();
    }
    
     @Override
    public List<RegistroSalida> listaPorIdunidadPorIdmotivoPorFechas(Integer idunidad, Integer idmotivo, Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("RegistroSalida.findByIdunidadByIdmotivoByFechas").setParameter("idunidad", idunidad).setParameter("idmotivo", idmotivo).setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }
    
    
    
}
