package com.zarcillo.dao;

import com.zarcillo.domain.MotivoEntrada;
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
public class MotivoEntradaDAOImpl implements MotivoEntradaDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public MotivoEntrada busqueda(Integer idmotivo) {
        return (MotivoEntrada) em.createNamedQuery("MotivoEntrada.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }

    @Override
    public List<MotivoEntrada> listaGeneral() {
        return em.createNamedQuery("MotivoEntrada.findAll").getResultList();
    }
    
    
    
}
