package com.zarcillo.dao;

import com.zarcillo.domain.Vendedor;
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
public class VendedorDAOImpl implements VendedorDAO{
    @PersistenceContext
    private EntityManager em;
    
    @Override
    public Vendedor busqueda(Integer idvendedor) {
        return (Vendedor) em.createNamedQuery("Vendedor.findByIdvendedor").setParameter("idvendedor", idvendedor).getSingleResult();
    }

    @Override
    public List<Vendedor> listaPorBactivo() {
        return em.createNamedQuery("Vendedor.findByBactivo").getResultList();
    }

    @Override
    public List<Vendedor> listaGeneral() {
        return em.createNamedQuery("Vendedor.findAll").getResultList();
    }
    
    
    
    
}
