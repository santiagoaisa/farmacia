package com.zarcillo.dao;

import com.zarcillo.domain.DepositoProveedor;
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
public class DepositoProveedorDAOImpl implements DepositoProveedorDAO {
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public DepositoProveedor buscarPorIddeposito(Integer iddeposito) {
        return (DepositoProveedor) em.createNamedQuery("DepositoProveedor.findByIddeposito").setParameter("iddeposito", iddeposito).getSingleResult();
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("DepositoProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
                return em.createNamedQuery("DepositoProveedor.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    
    
}
