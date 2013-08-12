package com.zarcillo.dao;

import com.zarcillo.domain.Linea;
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
public class LineaDAOImpl implements LineaDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Linea busqueda(Integer idlinea) {
        return (Linea) em.createNamedQuery("Linea.findByIdlinea").setParameter("idlinea", idlinea).getSingleResult();
    }

    @Override
    public List<Linea> listaActivos() {
        return em.createNamedQuery("Linea.findByBactivo").getResultList();
    }

    @Override
    public List<Linea> listaGeneral() {
        return em.createNamedQuery("Linea.findAll").getResultList();
    }

    @Override
    public List<Linea> listaConStock(Integer idalmacen) {
        String sql = "select distinct l.* from linea l,sublinea s,producto p,existencia e "
                + " where l.idlinea=s.idlinea and s.idsublinea=p.idsublinea "
                + " and p.idproducto=e.idproducto and (e.nstock>0 or e.nstockm>0 ) and e.idalmacen=:idalmacen  "
                + " order by l.cnomlinea ";
        return em.createNativeQuery(sql, Linea.class).setParameter("idalmacen", idalmacen).getResultList();
    }
}
