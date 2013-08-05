package com.zarcillo.dao;

import com.zarcillo.domain.AmortizacionProveedor;
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
public class AmortizacionProveedorDAOImpl implements AmortizacionProveedorDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public List<AmortizacionProveedor> listaPorIdcuenta(Integer idcuenta) {
        return em.createNamedQuery("AmortizacionProveedor.findByIdcuenta").setParameter("idcuenta", idcuenta).getResultList();
    }

    @Override
    public List<AmortizacionProveedor> listaPorIddeposito(Integer iddeposito) {
        return em.createNamedQuery("AmortizacionProveedor.findByIddeposito").setParameter("iddeposito", iddeposito).getResultList();
    }
    
    
    
}
