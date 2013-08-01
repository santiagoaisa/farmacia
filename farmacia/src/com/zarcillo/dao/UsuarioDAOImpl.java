package com.zarcillo.dao;

import com.zarcillo.domain.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Usuario busqueda(Integer idusuario) {
        return (Usuario) em.createNamedQuery("Usuario.findByIdusuario").setParameter("idusuario",idusuario).getSingleResult();        
    }

   

    @Override
    public Usuario buscarPorLoginPorClave(String clogin, String clave) {
        return (Usuario) em.createNamedQuery("Usuario.findByCloginByCclave").setParameter("clogin", clogin).setParameter("cclave", clave).getSingleResult();        
    }

    @Override
    public Usuario buscarPorLogin(String clogin) {
        Usuario usuario;
        try {            
            usuario = (Usuario) em.createNamedQuery("Usuario.findByClogin").setParameter("clogin", clogin).getSingleResult();            
        } catch (NoResultException e) {
            usuario = new Usuario();
        }
        return usuario;
    }

    @Override
    public List<Usuario> listaPorIdrol(Integer idrol) {
        return em.createNamedQuery("Usuario.findByIdrol").setParameter("idrol",idrol).getResultList();
    }
    
    
    
}
