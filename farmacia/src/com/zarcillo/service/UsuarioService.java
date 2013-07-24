package com.zarcillo.service;

import com.zarcillo.domain.Usuario;

public interface UsuarioService {

    public Usuario buscarPorLoginPorClave(String clogin,String cclave);
    public Usuario buscarPorLogin(String clogin);
    
}
