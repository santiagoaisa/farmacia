package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotaboProveedor;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class MotivoNotaboProveedorDAOImpl implements MotivoNotaboProveedorDAO{
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public MotivoNotaboProveedor busqueda(Integer idmotivo) {
        return (MotivoNotaboProveedor) em.createNamedQuery("MotivoNotaboProveedor.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }
}
