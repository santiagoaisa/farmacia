package com.zarcillo.dao;

import com.zarcillo.domain.Banco;
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
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Banco busqueda(Integer idbanco) {
        return (Banco) em.createNamedQuery("Banco.findByIdbanco").setParameter("idbanco", idbanco).getSingleResult();
                
    }
    
}