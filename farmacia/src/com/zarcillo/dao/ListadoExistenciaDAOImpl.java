package com.zarcillo.dao;

import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.dto.almacen.InventarioValorizado;
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
public class ListadoExistenciaDAOImpl implements ListadoExistenciaDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<InventarioValorizado> listaPorIdalmacenConStock(Integer idalmacen) {
        String sql = "select random() as id , s.idlinea ,sum( round(e.nstock+(e.nstockm/cast(p.nmenudeo as numeric))   *e.ncosuni,2))  as ncosto,0.00 as pcosto,0.00 as nporcentaje  "
                 +" from existencia e,producto p,sublinea s "
                 +" where e.idproducto=p.idproducto and p.idsublinea=s.idsublinea and e.idalmacen=:idalmacen and (nstock>0  or nstockm>0) "
                 +" group by s.idlinea order by s.idlinea ";

        return em.createNativeQuery(sql, InventarioValorizado.class).setParameter("idalmacen", idalmacen).getResultList();
    }

    @Override
    public List<InventarioLote> listaPorIdalmacenPorLineasConStock(Integer idalmacen, List<Integer> lista) {
        String sql = "select random() as id,e.idproducto,e.nstock,e.cubicacion,l.nstock as ncanart,l.clote,l.cfecven,e.nstockm,l.nstockm as ncanartm "
                + "  from existencia e left join lote l on e.idproducto=l.idproducto "
                + "  and e.idalmacen=l.idalmacen and l.nstock>0,producto p,sublinea s "
                + "  where e.idproducto=p.idproducto and p.idsublinea=s.idsublinea and e.idalmacen=:idalmacen and s.idlinea in (:lista) and ( e.nstock>0 or e.nstockm>0)  "
                + "   order by s.idlinea,p.idproducto";

        return em.createNativeQuery(sql, InventarioLote.class).setParameter("idalmacen", idalmacen).setParameter("lista", lista).getResultList();
    }
}
