package com.zarcillo.dao;

import com.zarcillo.domain.Linea;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LineaDAO {
     Linea busqueda(Integer idlinea);
     List<Linea> listaActivos();
}
