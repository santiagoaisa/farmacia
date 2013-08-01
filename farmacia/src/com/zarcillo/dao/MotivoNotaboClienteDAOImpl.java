package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotaboCliente;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class MotivoNotaboClienteDAOImpl implements MotivoNotaboClienteDAO{
    
      @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public MotivoNotaboCliente busqueda(Integer idmotivo) {
        return (MotivoNotaboCliente) em.createNamedQuery("MotivoNotaboCliente.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }
    
}
