package com.zarcillo.dao;

import com.zarcillo.domain.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void registrar(Usuario usuario) {
        em.persist(usuario);
    }

    @Override
    public void actualizar(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    public void eliminar(Usuario usuario) {
        em.remove(em.merge(usuario));
    }

    @Override
    public Usuario buscarPorLoginPorClave(String clogin, String clave) {
        Usuario usuario = (Usuario) em.createNamedQuery("Usuario.findByCloginByCclave").setParameter("clogin", clogin).setParameter("cclave", clave).getSingleResult();
        return usuario;
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
}
