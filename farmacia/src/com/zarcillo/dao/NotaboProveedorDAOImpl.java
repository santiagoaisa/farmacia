package com.zarcillo.dao;

import com.zarcillo.domain.NotaboProveedor;
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
public class NotaboProveedorDAOImpl implements NotaboProveedorDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public NotaboProveedor busqueda(Integer idnotabo) {
        return (NotaboProveedor) em.createNamedQuery("NotaboProveedor.findByIdnotabo").setParameter("idnotabo", idnotabo).getSingleResult();
    }

    @Override
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return em.createNamedQuery("NotaboProveedor.findByIdunidadByIdproveedorByNano").setParameter("idunidad", idunidad).setParameter("idproveedor", idproveedor).setParameter("nano", nano).getResultList();
    }
}
