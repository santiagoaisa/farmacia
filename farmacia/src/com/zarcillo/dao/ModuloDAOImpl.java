package com.zarcillo.dao;

import com.zarcillo.domain.Modulo;
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
public class ModuloDAOImpl implements ModuloDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Modulo busqueda(Integer idmodulo) {
        return (Modulo) em.createNamedQuery("Modulo.findByIdmodulo").setParameter("idmodulo", idmodulo).getSingleResult();
    }

    @Override
    public List<Modulo> listaPorIdrol(Integer idrol) {
        String sql = "select distinct m.* from modulo m,menu mm,mapa p where m.idmodulo=mm.idmodulo and mm.idmenu=p.idmenu and p.idrol=:idrol order by m.norden ";
        return em.createNativeQuery(sql, Modulo.class).setParameter("idrol", idrol).getResultList();
    }

    @Override
    public List<Modulo> listaGeneral() {
        return em.createNamedQuery("Modulo.findAll").getResultList();
    }
}
