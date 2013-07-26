package com.zarcillo.dao;

import com.zarcillo.domain.Almacen;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class AlmacenDAOImpl implements AlmacenDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Almacen busqueda(Integer idalmacen) {
        return (Almacen) em.createNamedQuery("Almacen.findByIdalmacen").setParameter("idalmacen", idalmacen).getSingleResult();
    }
    
}
