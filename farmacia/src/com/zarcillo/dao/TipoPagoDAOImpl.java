package com.zarcillo.dao;

import com.zarcillo.domain.TipoPago;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class TipoPagoDAOImpl implements TipoPagoDAO{

      @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public TipoPago busqueda(Integer idtipo) {
        return (TipoPago) em.createNamedQuery("TipoPago.findByIdtipo").setParameter("idtipo", idtipo).getSingleResult();
    }
    
}
