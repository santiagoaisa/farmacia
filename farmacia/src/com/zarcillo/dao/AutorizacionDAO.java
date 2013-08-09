package com.zarcillo.dao;

import com.zarcillo.domain.Autorizacion;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AutorizacionDAO {
    Autorizacion busqueda(Integer idautorizacion);
    List<Autorizacion> listaGeneral();
}
