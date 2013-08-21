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
    public List<InventarioLote> listaPorIdalmacenPorLineasConStock(Integer idalmacen, List<Integer> lista) {
        String sql = "select random() as id,e.idproducto,e.nstock,e.cubicacion,l.nstock as ncanart,l.clote,l.cfecven,e.nstockm,l.nstockm as ncanartm "
                + "  from existencia e left join lote l on e.idproducto=l.idproducto "
                + "  and e.idalmacen=l.idalmacen and (l.nstock>0 or l.nstockm>0) ,producto p,sublinea s "
                + "  where e.idproducto=p.idproducto and p.idsublinea=s.idsublinea and e.idalmacen=:idalmacen and s.idlinea in (:lista) and ( e.nstock>0 or e.nstockm>0)  "
                + "   order by s.idlinea,p.idproducto";

        return em.createNativeQuery(sql, InventarioLote.class).setParameter("idalmacen", idalmacen).setParameter("lista", lista).getResultList();
    }
}
