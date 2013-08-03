package com.zarcillo.service;

import com.zarcillo.domain.Acceso;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AccesoService {
     public List<Acceso> listaPorIdusuario(Integer idusuario);
}
