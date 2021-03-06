package com.zarcillo.dao;

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
public class ListadoClienteDAOImpl implements ListadoClienteDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public List<Date> listaFechasCronogramaCobro(Date dfecha1, Date dfecha2) {
         String sql = " select distinct dfecven "
                + " from comprobante_emitido "
                + " where dfecven BETWEEN :dfecha1 and :dfecha2 and nsaldo>0 "
                + " union "
                + " select distinct dfecven "
                + " from letra_cliente   "
                + " where dfecven BETWEEN  :dfecha1 and :dfecha2 and nsaldo>0 ORDER BY dfecven ";

        return em.createNativeQuery(sql).setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }
    
}
