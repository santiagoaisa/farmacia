package com.zarcillo.dao;

import com.zarcillo.domain.Lote;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class LoteDAOImpl implements LoteDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Lote buscarPorIdalmacenPorIdproductoPorCloteParaIngreso(Integer idalmacen, String idproducto, String clote) {
        Lote lote;
        try {
            lote = (Lote) em.createNamedQuery("Lote.findByIdalmacenByIdproductoByCloteByIngreso").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).setParameter("clote", clote.trim().toUpperCase()).setMaxResults(1).getSingleResult();
        } catch (NoResultException e) {
            lote = new Lote();
        }

        return lote;
    }

    @Override
    public Lote buscarPorIdalmacenPorIdproductoPorCloteParaAnulacion(Integer idalmacen, String idproducto, String clote) {
        Lote lote;
        try {
            lote = (Lote) em.createNamedQuery("Lote.findByIdalmacenByIdproductoByCloteByAnulacion").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).setParameter("clote", clote.trim().toUpperCase()).setMaxResults(1).getSingleResult();
        } catch (NoResultException e) {
            lote = new Lote();
        }

        return lote;
    }

    @Override
    public Lote buscarPorIdalmacenPorIdproductoPorCloteParaVenta(Integer idalmacen, String idproducto, String clote) {
        Lote lote;
        try {
            lote = (Lote) em.createNamedQuery("Lote.findByIdalmacenByIdproductoByCloteByVenta").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).setParameter("clote", clote.trim().toUpperCase()).setMaxResults(1).getSingleResult();
        } catch (NoResultException e) {
            lote = new Lote();
        }

        return lote;
    }

    @Override
    public List<Lote> listaPorIdalmacenPorIdproductoParaVentaEntero(Integer idalmacen, String idproducto) {
        return em.createNamedQuery("Lote.findByIdalmacenByIdproductoByVentaEntero").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getResultList();
    }

    @Override
    public List<Lote> listaPorIdalmacenPorIdproductoParaVentaFraccion(Integer idalmacen, String idproducto) {
        return em.createNamedQuery("Lote.findByIdalmacenByIdproductoByVentaFraccion").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getResultList();
    }
    
    

    @Override
    public List<Lote> listaPorIdalmacenPorIdproductoParaListado(Integer idalmacen, String idproducto) {
        return em.createNamedQuery("Lote.findByIdalmacenByIdproductoByListado").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getResultList();
    }

    @Override
    public Integer cantidadBloqueadaPorIdalmacenPorIdproductoBloqueados(Integer idalmacen, String idproducto) {
        String sql = "select sum(nstock) from lote  where idalmacen=:idalmacen and idproducto=:idproducto and bbloqueado=true  ";

        BigInteger nstock;
        try {
            nstock = (BigInteger) em.createNativeQuery(sql).setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getSingleResult();
        } catch (NoResultException e) {
            nstock = new BigInteger("0");
        }
        if (nstock == null) {
            nstock = new BigInteger("0");
        }
        return nstock.intValue();
    }
}
