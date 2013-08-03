package com.zarcillo.dao;

import com.zarcillo.domain.Modulo;
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
}
