package com.zarcillo.dao;

import com.zarcillo.domain.Periodo;
import com.zarcillo.negocio.Año;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class PeriodoDAOImpl implements PeriodoDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Periodo busqueda(Integer idperiodo) {
        return (Periodo) em.createNamedQuery("Periodo.findByIdperiodo").setParameter("idperiodo", idperiodo).getSingleResult();

    }

    @Override
    public Periodo buscarPorNanoPorNmes(Integer nano, Integer nmes) {
        return (Periodo) em.createNamedQuery("Periodo.findByNanoByNmes").setParameter("nano", nano).setParameter("nmes", nmes).getSingleResult();
    }


    @Override
    public Periodo buscarPorFecha(Date dfecha) {
        Calendar calendario = Calendar.getInstance();
        calendario.setTime(dfecha);
        Integer nano = calendario.get(Calendar.YEAR);
        Integer nmes = calendario.get(Calendar.MONTH) + 1;
        return (Periodo) em.createNamedQuery("Periodo.findByNanoByNmes").setParameter("nano", nano).setParameter("nmes", nmes).getSingleResult();
    }

    @Override
    public List<Año> listaAños() {
        String sql = "select nano FROM periodo  group by nano  order by nano DESC";
        return em.createNativeQuery(sql, Año.class).getResultList();
    }
    
    
    
    
}
