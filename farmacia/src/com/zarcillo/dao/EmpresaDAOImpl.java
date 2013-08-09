package com.zarcillo.dao;

import com.zarcillo.domain.Empresa;
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
public class EmpresaDAOImpl implements EmpresaDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Empresa busqueda(Integer idempresa) {
        return (Empresa) em.createNamedQuery("Empresa.findByIdempresa").setParameter("idempresa", idempresa).getSingleResult();
    }

    @Override
    public List<Empresa> listaGeneral() {
        return em.createNamedQuery("Empresa.findAll").getResultList();
    }
    
    
    
    
    
}
