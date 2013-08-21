package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DetalleAutorizacionDAO;
import com.zarcillo.dao.UsuarioDAO;
import com.zarcillo.dao.UsuarioVendedorDAO;
import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.UsuarioVendedor;
import com.zarcillo.negocio.Encriptar;
import java.security.MessageDigest;
import java.util.ArrayList;
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
     @Autowired
    private UsuarioVendedorDAO usuariovendedordao;

    @Override
    public Usuario registrar(Usuario usuario) {
         try {
             String claveEncriptada = Encriptar.encriptar(usuario.getCclave());
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
            String claveEncriptada = Encriptar.encriptar(usuario.getCclave());                    
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
   
    public List<Usuario> listaPorIdrol(Integer idrol) {
        return usuariodao.listaPorIdrol(idrol);
    }
    
    @Override
    public Usuario buscarPorLogin(String clogin) {
        return usuariodao.buscarPorLogin(clogin);
    }

    @Override
   
    public List<DetalleAutorizacion> listaDetalleAutorizacionPorIdusuario(Integer idusuario) {
        return detalleautorizaciondao.listaPorIdusuario(idusuario);
    }

    @Override
    public List<Usuario> listaUsuario() {
        List<UsuarioVendedor> lista=usuariovendedordao.listaGeneral();
        List<Usuario> listaRetorno=new ArrayList<>();
        for(UsuarioVendedor u:lista){
            if(!listaRetorno.contains(u.getIdusuario())){
                listaRetorno.add(u.getIdusuario());
            }
        }
        return listaRetorno;
    }
    
    
    
}
