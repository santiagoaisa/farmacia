package com.zarcillo.dao;

import com.zarcillo.domain.Proveedor;
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
public class ProveedorDAOImpl  implements ProveedorDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public Proveedor busqueda(Integer idproveedor) {
        return (Proveedor) em.createNamedQuery("Proveedor.findByIdproveedor").setParameter("idproveedor", idproveedor).getSingleResult();
    }

    @Override
    public List<Proveedor> busquedaListaPorCnomprovee(String ccriterio) {
        return em.createNamedQuery("Proveedor.findByCnomprovee").setParameter("ccriterio", ccriterio.trim().toUpperCase().concat("%")).getResultList();
    }

    @Override
    public List<Proveedor> listaGeneral() {
        return em.createNamedQuery("Proveedor.findAll").getResultList();
    }
    
    
    
}
