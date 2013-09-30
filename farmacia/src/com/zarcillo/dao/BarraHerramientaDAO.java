package com.zarcillo.dao;

import com.zarcillo.domain.BarraHerramienta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface BarraHerramientaDAO {
    BarraHerramienta busqueda(Integer idbarra);
    List<BarraHerramienta> listaGeneral();
}
