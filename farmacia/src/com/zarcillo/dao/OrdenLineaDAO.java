package com.zarcillo.dao;

import com.zarcillo.domain.OrdenLinea;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface OrdenLineaDAO {
    List<OrdenLinea> listaPorIdunidad(Integer idunidad);
}
