package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotcarCliente;
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
public class MotivoNotcarClienteDAOImpl implements MotivoNotcarClienteDAO{
    
    @PersistenceContext
    private EntityManager em;


    @Override
    public MotivoNotcarCliente busqueda(Integer idmotivo) {
        return (MotivoNotcarCliente) em.createNamedQuery("MotivoNotcarCliente.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }

    @Override
    public List<MotivoNotcarCliente> listaGeneral() {
        return em.createNamedQuery("MotivoNotcarCliente.findAll").getResultList();
    }
    
    
    
     
}
