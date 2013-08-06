package com.zarcillo.dao;

import com.zarcillo.domain.DepositoCliente;
import java.io.Serializable;
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
public class DepositoClienteDAOImpl implements DepositoClienteDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public DepositoCliente buscarPorIddeposito(Integer iddeposito) {
        return (DepositoCliente) em.createNamedQuery("DepositoCliente.findByIddeposito").setParameter("iddeposito", iddeposito).getSingleResult();
    }


    @Override
    public List<DepositoCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("DepositoProveedor.findByIdunidadByIdproveedorByNanoPendientes").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }
}
