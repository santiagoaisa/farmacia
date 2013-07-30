package com.zarcillo.dao;

import com.zarcillo.domain.Vendedor;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class VendedorDAOImpl implements VendedorDAO{
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public Vendedor busqueda(Integer idvendedor) {
        return (Vendedor) em.createNamedQuery("Vendedor.findByIdvendedor").setParameter("idvendedor", idvendedor).getSingleResult();
    }
    
}
