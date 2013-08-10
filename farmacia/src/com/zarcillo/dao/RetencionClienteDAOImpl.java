package com.zarcillo.dao;

import com.zarcillo.domain.RetencionCliente;
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
public class RetencionClienteDAOImpl implements RetencionClienteDAO{
    
     @PersistenceContext
    private EntityManager em;

    @Override
    public RetencionCliente buscarPorIdunidadPorCseriePorCnumero(Integer idunidad, String cserie, String cnumero) {
        return (RetencionCliente) em.createNamedQuery("RetencionCliente.findByIdunidadByCserieByCnumero").setParameter("idunidad", idunidad).setParameter("cserie", cserie).setParameter("cnumero", cnumero).getSingleResult();
    }

    @Override
    public RetencionCliente buscarPorIdretencion(Integer idretencion) {
        return (RetencionCliente) em.createNamedQuery("RetencionCliente.findByIdretencion").setParameter("idretencion", idretencion).getSingleResult();
    }

    @Override
    public List<RetencionCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("RetencionCliente.findByIdunidadByIdclienteByNano").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<RetencionCliente> listaPorIdunidadPorIdperiodo(Integer idunidad, Integer idperiodo) {
        return em.createNamedQuery("RetencionCliente.findByIdunidadByIdperiodo").setParameter("idunidad", idunidad).setParameter("idperiodo", idperiodo).getResultList();
    }
    
    
    
}
