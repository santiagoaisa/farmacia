package com.zarcillo.dao;

import com.zarcillo.domain.UsuarioVendedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface UsuarioVendedorDAO {
    List<UsuarioVendedor> listaPorIdusuario(Integer idusuario);
    List<UsuarioVendedor> listaGeneral();
}
