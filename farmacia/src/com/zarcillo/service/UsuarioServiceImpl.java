package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.UsuarioDAO;
import com.zarcillo.domain.Usuario;
import com.zarcillo.estado.MotivoLog;
import java.math.BigInteger;
import java.security.MessageDigest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("usuarioService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioDAO usuariodao;
    @Autowired
    private CrudDAO cruddao;

    @Override
    @Transactional
    public Usuario actualizar(Usuario usuario) {
        try {
            String claveEncriptada = encriptar(usuario.getCclave());
            usuario.setCclave(claveEncriptada);
            cruddao.actualizar(usuario);


        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar al Usuario");
        }
        return usuario;
    }

    private static String encriptar(String ccadena) {
        String hash = "";
        try {
            //encriptar a sha-256        
            byte[] digest = null;
            byte[] buffer = ccadena.getBytes();
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.reset();
            messageDigest.update(buffer);
            digest = messageDigest.digest();

            for (byte aux : digest) {
                int b = aux & 0xff;
                if (Integer.toHexString(b).length() == 1) {
                    hash += "0";
                }
                hash += Integer.toHexString(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hash;
    }

    @Override
    public Usuario buscarPorLogin(String clogin) {
        return usuariodao.buscarPorLogin(clogin);
    }
}
