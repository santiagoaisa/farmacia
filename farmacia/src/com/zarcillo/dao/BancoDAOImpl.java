package com.zarcillo.dao;

import com.zarcillo.domain.Banco;
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
public class BancoDAOImpl implements BancoDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public Banco busqueda(Integer idbanco) {
        return (Banco) em.createNamedQuery("Banco.findByIdbanco").setParameter("idbanco", idbanco).getSingleResult();                
    }

    @Override
    public List<Banco> listaGeneral() {
        return em.createNamedQuery("Banco.findAll").getResultList();
    }
    
    
    
}
