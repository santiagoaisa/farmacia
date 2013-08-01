package com.zarcillo.dao;

import com.zarcillo.domain.DetalleAutorizacion;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DetalleAutorizacionDAO {
    List<DetalleAutorizacion> listaPorIdusuario(Integer idusuario);
}
