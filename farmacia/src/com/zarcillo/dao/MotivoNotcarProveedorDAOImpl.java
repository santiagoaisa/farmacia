package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotcarProveedor;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class MotivoNotcarProveedorDAOImpl implements MotivoNotcarProveedorDAO{
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public MotivoNotcarProveedor busqueda(Integer idmotivo) {
        return (MotivoNotcarProveedor) em.createNamedQuery("MotivoNotcarProveedor.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }
    
}
