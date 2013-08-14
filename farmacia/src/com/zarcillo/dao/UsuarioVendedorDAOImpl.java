package com.zarcillo.dao;

import com.zarcillo.domain.UsuarioVendedor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class UsuarioVendedorDAOImpl implements UsuarioVendedorDAO{

     @PersistenceContext
    private EntityManager em;
    
    @Override
    public List<UsuarioVendedor> listaPorIdusuario(Integer idusuario) {
        return em.createNamedQuery("UsuarioVendedor.findByIdusuario").setParameter("idusuario", idusuario).getResultList();
    }

    @Override
    public List<UsuarioVendedor> listaGeneral() {
        return em.createNamedQuery("UsuarioVendedor.findAll").getResultList();
    }
    
    
    
    
    
}
