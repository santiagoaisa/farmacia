package com.zarcillo.dao;

import com.zarcillo.domain.TipoCuentaBancaria;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class TipoCuentaBancariaDAOImpl implements TipoCuentaBancariaDAO{

     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public TipoCuentaBancaria busqueda(Integer idtipo) {
        return (TipoCuentaBancaria) em.createNamedQuery("TipoCuentaBancaria.findByIdtipo").setParameter("idtipo", idtipo).getSingleResult();
    }
    
}
