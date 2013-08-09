package com.zarcillo.dao;

import com.zarcillo.domain.Presentacion;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface PresentacionDAO {
    Presentacion busqueda(Integer idpresentacion);
    List<Presentacion> listaGeneral();
}
