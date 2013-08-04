package com.zarcillo.dao;

import com.zarcillo.domain.TipoPago;
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
public class TipoPagoDAOImpl implements TipoPagoDAO{

      @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public TipoPago busqueda(Integer idtipo) {
        return (TipoPago) em.createNamedQuery("TipoPago.findByIdtipo").setParameter("idtipo", idtipo).getSingleResult();
    }

    @Override
    public List<TipoPago> listaTipoPagoPorBcobro() {
        return em.createNamedQuery("TipoPago.findByBcobro").getResultList();
    }

    @Override
    public List<TipoPago> listaTipoPagoPorBpago() {
        return em.createNamedQuery("TipoPago.findByBpago").getResultList();
    }

    @Override
    public TipoPago buscarPorCcodigosunat(String ccodigosunat) {
        return (TipoPago) em.createNamedQuery("TipoPago.findByCcodigosunat").setParameter("ccodigosunat", ccodigosunat).getSingleResult();
    }
    
    
    
    
    
    
}
