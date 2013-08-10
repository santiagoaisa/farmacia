package com.zarcillo.dao;

import com.zarcillo.domain.Cliente;
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
public class ClienteDAOImpl implements ClienteDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Cliente buscarPorIdcliente(Integer idcliente) {
        return (Cliente) em.createNamedQuery("Cliente.findByIdcliente").setParameter("idcliente", idcliente).getSingleResult();
    }

    @Override
    public Cliente buscarPorIdunidadPorIdcliente(Integer idunidad, Integer idcliente) {
        return (Cliente) em.createNamedQuery("Cliente.findByIdunidadByIdcliente").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).getSingleResult();
    }

    @Override
    public List<Cliente> listaPorIdunidad(Integer idunidad) {
        return em.createNamedQuery("Cliente.findByIdunidad").setParameter("idunidad", idunidad).getResultList();
    }

    @Override
    public List<Cliente> busquedaListaPorIdunidadPorCnomcli(Integer idunidad, String cnomcli) {
        return em.createNamedQuery("Cliente.findByIdunidadByCnomcli").setParameter("idunidad", idunidad).setParameter("cnomcli", cnomcli.toUpperCase().concat("%")).getResultList();
    }
}
