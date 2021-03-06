package com.zarcillo.dao;

import com.zarcillo.domain.NotaboProveedor;
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
public class NotaboProveedorDAOImpl implements NotaboProveedorDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public NotaboProveedor buscarPorIdnotabo(Integer idnotabo) {
        return (NotaboProveedor) em.createNamedQuery("NotaboProveedor.findByIdnotabo").setParameter("idnotabo", idnotabo).getSingleResult();
    }

    @Override
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("NotaboProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("NotaboProveedor.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    
}
