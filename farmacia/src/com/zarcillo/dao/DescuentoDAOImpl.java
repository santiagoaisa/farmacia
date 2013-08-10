package com.zarcillo.dao;

import com.zarcillo.domain.Descuento;
import java.math.BigDecimal;
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
public class DescuentoDAOImpl implements DescuentoDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Descuento busquedaPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto) {
        Descuento descuento;
        try {
            descuento = (Descuento) em.createNamedQuery("Descuento.findByIdalmacenByIdproducto").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getSingleResult();
        } catch (NoResultException e) {
            descuento = new Descuento(idalmacen, idproducto);
        }

        return descuento;
    }

    @Override
    public BigDecimal maximoDescuento(Integer idalmacen, String idproducto) {
        String sql = "select maximo_descuento(ndesc1,ndesc2,ndesc3,ndesc4) "
                + " from descuento  "
                + " where idalmacen=:idalmacen and idproducto=:idproducto ";
        BigDecimal ndescuento;
        try {
            ndescuento = (BigDecimal) em.createNativeQuery(sql).setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).getSingleResult();
        } catch (NoResultException e) {
            ndescuento = new BigDecimal("0");
        }

        return ndescuento;
    }
}
