package com.zarcillo.dao;

import com.zarcillo.domain.TipoPersona;
import java.io.Serializable;
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
public class TipoPersonalDAOImpl implements TipoPersonaDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public TipoPersona busqueda(Integer idtipo) {
        return (TipoPersona) em.createNamedQuery("TipoPersona.findIdtipo").setParameter("idtipo", idtipo).getSingleResult();
    }

    @Override
    public List<TipoPersona> listaGeneral() {
        return em.createNamedQuery("TipoPersona.findIdtipo").getResultList();
    }
    
    
    
}
