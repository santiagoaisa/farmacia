package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotcarCliente;
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
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;


    @Override
    public MotivoNotcarCliente busqueda(Integer idmotivo) {
        return (MotivoNotcarCliente) em.createNamedQuery("MotivoNotcarCliente.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }
    
     
}
