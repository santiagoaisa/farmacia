package com.zarcillo.dao;

import com.zarcillo.domain.CuentaPagar;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class CuentaPagarDAOImpl implements CuentaPagarDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public CuentaPagar buscarPorIdregentrada(Integer idregentrada) {
        CuentaPagar cuentapagar;
        try {
            cuentapagar = (CuentaPagar) em.createNamedQuery("CuentaPagar.findByIdregentrada").setParameter("idregentrada", idregentrada).getSingleResult();
        } catch (NoResultException e) {
            cuentapagar = new CuentaPagar();
        }
        return cuentapagar;
    }

    @Override
    public CuentaPagar buscarPorIdcuenta(Integer idcuenta) {
        return (CuentaPagar) em.createNamedQuery("CuentaPagar.findByIdcuenta").setParameter("idcuenta", idcuenta).getSingleResult();
    }

    
    
    
    @Override
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("CuentaPagar.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("CuentaPagar.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    
    
    
    
}
