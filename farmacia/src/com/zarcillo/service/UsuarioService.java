package com.zarcillo.service;

import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Usuario;
import java.util.List;

public interface UsuarioService {
    public Usuario registrar(Usuario usuario);
    public Usuario actualizar(Usuario usuario);
    public void eliminar(Usuario usuario);
    public Usuario buscar(Integer idusuario);
    public List<Usuario> listaPorIdrol(Integer idrol);
    public Usuario buscarPorLogin(String clogin);
    public List<DetalleAutorizacion> listaDetalleAutorizacionPorIdusuario(Integer idusuario);
}
