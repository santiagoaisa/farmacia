package com.zarcillo.dao;

import com.zarcillo.domain.CondicionVenta;
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
public class CondicionVentaDAOImpl implements CondicionVentaDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public CondicionVenta busqueda(Integer idcondicion) {
        return (CondicionVenta) em.createNamedQuery("CondicionVenta.findAll").setParameter("idcondicion", idcondicion).getSingleResult();
    }

    @Override
    public List<CondicionVenta> listaGeneral() {
        return em.createNamedQuery("CondicionVenta.findAll").getResultList();
    }
    
    
    
}
