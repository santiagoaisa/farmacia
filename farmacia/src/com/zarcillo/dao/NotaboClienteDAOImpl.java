package com.zarcillo.dao;

import com.zarcillo.domain.NotaboCliente;
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
public class NotaboClienteDAOImpl implements NotaboClienteDAO{

    @PersistenceContext
    private EntityManager em;
    
    @Override
    public NotaboCliente buscarPorIdnotabo(Integer idnotabo) {
        return (NotaboCliente) em.createNamedQuery("NotaboCliente.findByIdnotabo").setParameter("idnotabo", idnotabo).getSingleResult();
    }

    @Override
    public List<NotaboCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("NotaboCliente.findByIdunidadByIdclienteByNano").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }
    
}
