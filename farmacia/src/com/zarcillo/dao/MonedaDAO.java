package com.zarcillo.dao;

import com.zarcillo.domain.Moneda;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MonedaDAO {
    Moneda busqueda(Integer idmoneda);
    List<Moneda> listaGeneral();
}
