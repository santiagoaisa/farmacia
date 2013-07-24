package com.zarcillo.dao;

import com.zarcillo.domain.Usuario;

public interface UsuarioDAO {
    
    void registrar(Usuario usuario);
    void actualizar(Usuario usuario);
    void eliminar(Usuario usuario);
    
    Usuario buscarPorLoginPorClave(String clogin,String clave);
    Usuario buscarPorLogin(String clogin);
}
