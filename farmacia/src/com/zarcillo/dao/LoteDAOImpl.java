package com.zarcillo.dao;

import com.zarcillo.domain.Lote;
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
public class LoteDAOImpl implements LoteDAO{

     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public Lote buscarPorIdalmacenPorIdproductoPorClote(Integer idalmacen, String idproducto, String clote) {
          Lote lote;
        try {
            lote = (Lote) em.createNamedQuery("Lote.findByIdalmacenByIdproductoByClote").setParameter("idalmacen", idalmacen).setParameter("idproducto", idproducto).setParameter("clote", clote).getSingleResult();
        } catch (NoResultException e) {
            lote = new Lote();
        }

        return lote;
    }
    
}
