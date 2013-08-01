package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DetalleAutorizacionDAO;
import com.zarcillo.dao.UsuarioDAO;
import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Usuario;
import java.security.MessageDigest;
import java.util.Date;
import java.util.List;
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
     @Autowired
    private DetalleAutorizacionDAO detalleautorizaciondao;

    @Override
    public Usuario registrar(Usuario usuario) {
         try {
             String claveEncriptada = encriptar(usuario.getCclave());
            usuario.setCclave(claveEncriptada);
            usuario.setDfecreg(new Date());
            cruddao.registrar(usuario);
            
            
             List<DetalleAutorizacion> listaAutorizacion = usuario.getDetalleAutorizacionCollection();

            DetalleAutorizacion detalle;
            for (DetalleAutorizacion da : listaAutorizacion) {
                detalle = new DetalleAutorizacion();
                detalle.setIdautorizacion(da.getIdautorizacion());
                detalle.setIdusuario(usuario);
                cruddao.registrar(detalle);
            }
            
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Usuario");
        }
        return usuario;
    }

    @Override
    @Transactional
    public Usuario actualizar(Usuario usuario) {
        try {
            String claveEncriptada = encriptar(usuario.getCclave());
            usuario.setCclave(claveEncriptada);
            
             //Se eliminan los detalles
            List<DetalleAutorizacion> listaAutorizacion = detalleautorizaciondao.listaPorIdusuario(usuario.getIdusuario());
            for (DetalleAutorizacion d : listaAutorizacion) {
                cruddao.eliminar(d);
            }
            
            List<DetalleAutorizacion> listaAutorizacionUsuario = usuario.getDetalleAutorizacionCollection();

            for (DetalleAutorizacion detalle : listaAutorizacionUsuario) {
                detalle.setIdusuario(usuario);

                if (detalle.getIddetalle() == null) {                    
                    cruddao.registrar(detalle);
                } else {
                    cruddao.actualizar(detalle);
                }
            }
            
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
    public void eliminar(Usuario usuario) {
        try {
            cruddao.eliminar(usuario);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Usuario");
        }
    }

    @Override
    public Usuario buscar(Integer idusuario) {
        try {
            return usuariodao.busqueda(idusuario);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el usuario con id:" + idusuario);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Usuario> listaPorIdrol(Integer idrol) {
        return usuariodao.listaPorIdrol(idrol);
    }
    
    @Override
    public Usuario buscarPorLogin(String clogin) {
        return usuariodao.buscarPorLogin(clogin);
    }

    @Override
    @Transactional(readOnly = true)
    public List<DetalleAutorizacion> listaDetalleAutorizacionPorIdusuario(Integer idusuario) {
        return detalleautorizaciondao.listaPorIdusuario(idusuario);
    }
    
    
    
}
