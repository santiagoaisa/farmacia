package com.zarcillo.dao;

import com.zarcillo.domain.Usuario;
import java.util.List;

public interface UsuarioDAO {
    
    Usuario busqueda(Integer idusuario);    
    Usuario buscarPorLoginPorClave(String clogin,String clave);
    Usuario buscarPorLogin(String clogin);
    
    List<Usuario> listaPorIdrol(Integer idrol);
}
