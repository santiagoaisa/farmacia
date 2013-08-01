package com.zarcillo.dao;

import com.zarcillo.domain.DetalleAutorizacion;
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
public class DetalleAutorizacionDAOImpl implements DetalleAutorizacionDAO{

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;
    
    @Override
    public List<DetalleAutorizacion> listaPorIdusuario(Integer idusuario) {
        return em.createNamedQuery("DetalleAutorizacion.findByIdusuario").setParameter("idusuario",idusuario).getResultList();
    }
    
}
