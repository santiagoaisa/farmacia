package com.zarcillo.dao;

import com.zarcillo.domain.Acceso;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AccesoDAO {
    List<Acceso> listaPorIdusuario(Integer idusuario);
}
