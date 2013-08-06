package com.zarcillo.dao;

import com.zarcillo.domain.NotcarProveedor;
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
public class NotcarProveedorDAOImpl implements NotcarProveedorDAO{
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public NotcarProveedor buscarPorIdnotcar(Integer idnotcar) {
        return (NotcarProveedor) em.createNamedQuery("NotcarProveedor.findByIdnotcar").setParameter("idnotcar", idnotcar).getSingleResult();
    }

    @Override
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("NotcarProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("NotcarProveedor.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    
    
}
