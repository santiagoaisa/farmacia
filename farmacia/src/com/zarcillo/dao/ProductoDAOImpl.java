package com.zarcillo.dao;

import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigInteger;
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
public class ProductoDAOImpl implements ProductoDAO {
    
    @PersistenceContext
    private EntityManager em;
    
    @Override
    public Producto busqueda(String idproducto) {
        return (Producto) em.createNamedQuery("Producto.findByIdproducto").setParameter("idproducto", idproducto).getSingleResult();
    }
    
    @Override
    public Producto busquedaPorCcodigobarra(String ccodigobarra) {
        return (Producto) em.createNamedQuery("Producto.findByCcodigobarra").setParameter("ccodigobarra", ccodigobarra).getSingleResult();
    }
    
    @Override
    public List<Producto> busquedaListaPorDescripcion(String ccriterio) {
        return em.createNamedQuery("Producto.findByCnomproducto").setParameter("ccriterio", "%".concat(ccriterio.trim().toUpperCase().concat("%"))).getResultList();        
    }
    
    @Override
    public Integer numeroPorIdlinea(Integer idlinea) {
        String sql = "select count(*)+1 from producto  p,sublinea s "
                + "where p.idsublinea=s.idsublinea and s.idlinea=:idlinea ";
        
        BigInteger idregentrada1 = (BigInteger) em.createNativeQuery(sql).setParameter("idlinea", idlinea).getSingleResult();
        return idregentrada1.intValue();
        
        
    }
}
