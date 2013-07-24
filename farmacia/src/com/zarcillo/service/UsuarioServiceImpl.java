package com.zarcillo.service;

import com.zarcillo.dao.UsuarioDAO;
import com.zarcillo.domain.Usuario;
import java.math.BigInteger;
import java.security.MessageDigest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

@Service("usuarioService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioDAO usuariodao;

    @Override
    public Usuario buscarPorLoginPorClave(String clogin, String cclave) {
        Usuario usuario;

        try {
            //encriptar a md5
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(cclave.getBytes());

            BigInteger hash = new BigInteger(1, md5.digest());
            String claveEncriptada = hash.toString(16);

            usuario = usuariodao.buscarPorLoginPorClave(clogin, claveEncriptada);

        } catch (Exception e) {
            throw new ExceptionZarcillo("El Usuario No existe");
        }
        return usuario;

    }

    @Override
    public Usuario buscarPorLogin(String clogin) {         
        return usuariodao.buscarPorLogin(clogin);
    }
}
