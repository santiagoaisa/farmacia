package com.zarcillo.dao;

import com.zarcillo.domain.AmortizacionCliente;
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
public class AmortizacionClienteDAOImpl implements AmortizacionClienteDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public List<AmortizacionCliente> listaPorIdcomprobante(Integer idcomprobante) {
        return em.createNamedQuery("AmortizacionCliente.findByIdcomprobante").setParameter("idcomprobante", idcomprobante).getResultList();
    }

    @Override
    public List<AmortizacionCliente> listaPorIddeposito(Integer iddeposito) {
        return em.createNamedQuery("AmortizacionCliente.findByIddeposito").setParameter("iddeposito", iddeposito).getResultList();
    }

    @Override
    public List<AmortizacionCliente> listaPorIdcheque(Integer idcheque) {
        return em.createNamedQuery("AmortizacionCliente.findByIdcheque").setParameter("idcheque", idcheque).getResultList();
    }

    @Override
    public List<AmortizacionCliente> listaPorIdnotabo(Integer idnotabo) {
        return em.createNamedQuery("AmortizacionCliente.findByIdnotabo").setParameter("idnotabo", idnotabo).getResultList();
    }

    @Override
    public List<AmortizacionCliente> listaPorIdnotcar(Integer idnotcar) {
        return em.createNamedQuery("AmortizacionCliente.findByIdnotcar").setParameter("idnotcar", idnotcar).getResultList();
    }
}
