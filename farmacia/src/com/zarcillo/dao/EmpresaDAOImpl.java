package com.zarcillo.dao;

import com.zarcillo.domain.Empresa;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

/**
 *
 * @author saisa
 */
public class EmpresaDAOImpl implements EmpresaDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Empresa busqueda(Integer idempresa) {
        return (Empresa) em.createNamedQuery("Empresa.findByIdempresa").setParameter("idempresa", idempresa).getSingleResult();
    }
    
    
    
}
