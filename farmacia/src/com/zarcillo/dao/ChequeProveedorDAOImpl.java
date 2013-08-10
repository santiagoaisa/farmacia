package com.zarcillo.dao;

import com.zarcillo.domain.ChequeProveedor;
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
public class ChequeProveedorDAOImpl implements ChequeProveedorDAO{

    @PersistenceContext
    private EntityManager em;
    
    @Override
    public ChequeProveedor buscarPorIdcheque(Integer idcheque) {
        return (ChequeProveedor) em.createNamedQuery("ChequeProveedor.findByIdcheque").setParameter("idcheque", idcheque).getSingleResult();
    }

    @Override
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("ChequeProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("ChequeProveedor.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    

   
    
    
}
