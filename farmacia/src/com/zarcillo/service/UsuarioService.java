package com.zarcillo.service;

import com.zarcillo.domain.Usuario;

public interface UsuarioService {
    public Usuario actualizar(Usuario usuario);    
    public Usuario buscarPorLogin(String clogin);
    
}
