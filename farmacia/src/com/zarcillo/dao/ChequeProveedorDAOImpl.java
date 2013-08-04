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

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public ChequeProveedor busqueda(Integer idcheque) {
        return (ChequeProveedor) em.createNamedQuery("ChequeProveedor.findByIdcheque").setParameter("idcheque", idcheque).getSingleResult();
    }

    @Override
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("ChequeProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

   
    
    
}
