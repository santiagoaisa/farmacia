package com.zarcillo.dao;

import com.zarcillo.domain.ChequeCliente;
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
public class ChequeClienteDAOImpl implements ChequeClienteDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public ChequeCliente busqueda(Integer idcheque) {
        return (ChequeCliente) em.createNamedQuery("ChequeCliente.findByIdcheque").setParameter("idcheque", idcheque).getSingleResult();
    }


    @Override
    public List<ChequeCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("ChequeCliente.findByIdunidadByIdclienteByNano").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }

    
    
    
    
}
