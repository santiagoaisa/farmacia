package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotaboProveedor;
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
public class MotivoNotaboProveedorDAOImpl implements MotivoNotaboProveedorDAO{
     @PersistenceContext
    private EntityManager em;

    @Override
    public MotivoNotaboProveedor busqueda(Integer idmotivo) {
        return (MotivoNotaboProveedor) em.createNamedQuery("MotivoNotaboProveedor.findByIdmotivo").setParameter("idmotivo", idmotivo).getSingleResult();
    }

    @Override
    public List<MotivoNotaboProveedor> listaGeneral() {
        return em.createNamedQuery("MotivoNotaboProveedor.findAll").getResultList();
    }
    
    
    
}
