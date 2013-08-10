package com.zarcillo.dao;

import com.zarcillo.domain.RegistroSalida;
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
        return (RegistroSalida) em.createNamedQuery("RegistroSalida.findByIdregsalida").setParameter("idregaslida", idregsalida).getSingleResult();
    }

    @Override
    public RegistroSalida buscarPorIdunidadIdregsalida(Integer idunidad, Integer idregsalida) {
        return (RegistroSalida) em.createNamedQuery("RegistroSalida.findByIdunidadByIdregsalida").setParameter("idunidad", idunidad).setParameter("idregsalida", idregsalida).getSingleResult();
    }
    
    
    
    
    
}
