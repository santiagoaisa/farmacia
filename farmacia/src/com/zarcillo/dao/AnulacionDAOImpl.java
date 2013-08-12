package com.zarcillo.dao;

import com.zarcillo.domain.Anulacion;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class AnulacionDAOImpl implements AnulacionDAO{
    
      @PersistenceContext
    private EntityManager em;

    @Override
    public List<Anulacion> listaPorFechas(Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("Anulacion.findByFechas").setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }
    
}
