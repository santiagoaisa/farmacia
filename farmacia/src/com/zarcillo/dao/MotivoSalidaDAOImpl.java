package com.zarcillo.dao;

import com.zarcillo.domain.MotivoSalida;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class MotivoSalidaDAOImpl implements MotivoSalidaDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public MotivoSalida busqueda(Integer idmotivo) {
        return (MotivoSalida) em.createNamedQuery("MotivoSalida.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }
    
}
