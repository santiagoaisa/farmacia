package com.zarcillo.dao;

import com.zarcillo.domain.MotivoSalida;
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
public class MotivoSalidaDAOImpl implements MotivoSalidaDAO{

    @PersistenceContext
    private EntityManager em;
    
    @Override
    public MotivoSalida busqueda(Integer idmotivo) {
        return (MotivoSalida) em.createNamedQuery("MotivoSalida.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }

    @Override
    public List<MotivoSalida> listaGeneral() {
        return em.createNamedQuery("MotivoSalida.findAll").getResultList();
    }

    @Override
    public List<MotivoSalida> listaVenta() {
         return em.createNamedQuery("MotivoSalida.findByVenta").getResultList();
    }
    
    
    
}
