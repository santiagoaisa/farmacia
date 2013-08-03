package com.zarcillo.dao;

import com.zarcillo.domain.Mapa;
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
public class MapaDAOImpl implements MapaDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public List<Mapa> listaPorIdrolPorIdmodulo(Integer idrol, Integer idmodulo) {
        return em.createNamedQuery("Mapa.findByIdrolByIdmodulo").setParameter("idrol", idrol).setParameter("idmodulo", idmodulo).getResultList();
    }

    @Override
    public List<Mapa> listaPorIdrolPorIdmoduloPorNnivel(Integer idrol, Integer idmodulo, Integer nnivel) {
        return em.createNamedQuery("Mapa.findByIdrolByIdmoduloByNnivel1").setParameter("idrol", idrol).setParameter("idmodulo", idmodulo).setParameter("nnivel", nnivel).getResultList();
    }

    @Override
    public List<Mapa> listaEncabezado(Integer idrol, Integer idmodulo) {
        String sql = "select  m.* from mapa m,menu mm where m.idmenu=mm.idmenu and mm.nnivel2=0 and mm.nnivel3=0 and m.idrol=:idrol and mm.idmodulo=:idmodulo order by mm.norden  ";
        return em.createNativeQuery(sql, Mapa.class).setParameter("idrol", idrol).setParameter("idmodulo", idmodulo).getResultList();

    }

    @Override
    public List<Mapa> listaMenu(Integer idrol, Mapa mapa) {
        String sql = "select  m.* from mapa m,menu mm where m.idmenu=mm.idmenu and m.idrol=:idrol and mm.nnivel1=:nnivel1 and mm.nnivel3=0 and mm.idmenu<>:idmenu and mm.idmodulo=:idmodulo order by mm.norden ";
        return em.createNativeQuery(sql, Mapa.class).setParameter("idrol", idrol).setParameter("nnivel1", mapa.getIdmenu().getNnivel1()).setParameter("idmenu", mapa.getIdmenu().getIdmenu()).setParameter("idmodulo", mapa.getIdmenu().getIdmodulo().getIdmodulo()).getResultList();

    }

    @Override
    public List<Mapa> listaSubmenu(Integer idrol, Mapa mapa) {
        String sql = "select  m.* from mapa m,menu mm where m.idmenu=mm.idmenu and m.idrol=:idrol and mm.nnivel1=:nnivel1 and mm.nnivel3<>0 and mm.nnivel2=:nnivel2 and mm.idmodulo=:idmodulo order by mm.norden ";
        return em.createNativeQuery(sql, Mapa.class).setParameter("idrol", idrol).setParameter("nnivel1", mapa.getIdmenu().getNnivel1()).setParameter("nnivel2", mapa.getIdmenu().getNnivel2()).setParameter("idmodulo", mapa.getIdmenu().getIdmodulo().getIdmodulo()).getResultList();
    }
}
