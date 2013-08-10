package com.zarcillo.dao;

import com.zarcillo.domain.OrdenLinea;
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
public class OrdenLineaDAOImpl implements OrdenLineaDAO{
      @PersistenceContext
    private EntityManager em;

    @Override
    public List<OrdenLinea> listaPorIdunidad(Integer idunidad) {
        return em.createNamedQuery("OrdenLinea.findByIdunidad").setParameter("idunidad", idunidad).getResultList();
    }
  
    
    
}
