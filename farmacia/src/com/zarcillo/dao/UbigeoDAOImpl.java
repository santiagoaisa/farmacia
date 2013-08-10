package com.zarcillo.dao;

import com.zarcillo.domain.Ubigeo;
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
public class UbigeoDAOImpl implements UbigeoDAO{
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Ubigeo> listaGeneralDepartamento() {
        return em.createNamedQuery("Ubigeo.findByCdepartamento").getResultList();        
    }

    @Override
    public List<Ubigeo> listaGeneralProvincia() {
        return em.createNamedQuery("Ubigeo.findByProvincia").getResultList();        
    }

    @Override
    public List<Ubigeo> listaProvincia(String departamento) {
        return  em.createNamedQuery("Ubigeo.findByCprovincia").setParameter("departamento", departamento).getResultList();        
    }

    @Override
    public List<Ubigeo> listaDistrito(String departamento, String provincia) {
         return  em.createNamedQuery("Ubigeo.findByCdistrito").setParameter("departamento",departamento).setParameter("provincia",provincia).getResultList();        
    }

    @Override
    public Ubigeo buscarDepartamento(String departamento) {
         return (Ubigeo) em.createNamedQuery("Ubigeo.findByIddepartamento").setParameter("departamento",departamento).getSingleResult();
    }

    @Override
    public Ubigeo buscarProvincia(String departamento, String provincia) {
        return (Ubigeo) em.createNamedQuery("Ubigeo.findByIdprovincia").setParameter("departamento",departamento).setParameter("provincia",provincia) .getSingleResult();        
    }
    
    
    
}
