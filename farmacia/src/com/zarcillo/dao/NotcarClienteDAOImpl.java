package com.zarcillo.dao;

import com.zarcillo.domain.NotcarCliente;
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
public class NotcarClienteDAOImpl implements NotcarClienteDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public NotcarCliente buscarPorIdnotabo(Integer idnotcar) {        
        return (NotcarCliente) em.createNamedQuery("NotcarCliente.findByIdnotcar").setParameter("idnotcar",idnotcar).getSingleResult();
    }

    @Override
    public List<NotcarCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("NotcarCliente.findByIdunidadByIdclienteByNano").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }
}
