package com.zarcillo.dao;

import com.zarcillo.domain.HistoricoExistencia;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class HistoricoExistenciaDAOImpl implements HistoricoExistenciaDAO{
     @PersistenceContext
    private EntityManager em;

    @Override
    public List<HistoricoExistencia> listaPorIdperiodoPorIdalmacenPorIdlinea(Integer idperiodo, Integer idalmacen, Integer idlinea) {
        return em.createNamedQuery("HistoricoExistencia.findByIdperiodoByIdalmacenByIdlinea").setParameter("idperiodo", idperiodo).setParameter("idalmacen", idalmacen).setParameter("idlinea", idlinea).getResultList();
    }
    
    
    
    
}
