package com.zarcillo.dao;

import com.zarcillo.domain.RegistroEntrada;
import java.util.Date;
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
public class RegistroEntradaDAOImpl implements RegistroEntradaDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public RegistroEntrada busqueda(Integer idregentrada) {
        return (RegistroEntrada) em.createNamedQuery("RegistroEntrada.findByIdregentrada").setParameter("idregentrada", idregentrada).getSingleResult();
    }

    @Override
    public RegistroEntrada buscarPorIdalmacenPorIdregentrada(Integer idalmacen, Integer idregentrada) {
        return (RegistroEntrada) em.createNamedQuery("RegistroEntrada.findByIdalmacenByIdregentrada").setParameter("idalmacen", idalmacen).setParameter("idregentrada", idregentrada).getSingleResult();
    }

    @Override
    public List<RegistroEntrada> listaPorFechas(Integer idalmacen, Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("RegistroEntrada.findByIdalmacenByFechas").setParameter("idalmacen", idalmacen).setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }

    @Override
    public List<RegistroEntrada> listaPorIdalmacenPorIdproveedorPorNano(Integer idalmacen, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("RegistroEntrada.findByIdalmacenByIdproveedorByNano").setParameter("idalmacen", idalmacen).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
    
    
    
    
}
