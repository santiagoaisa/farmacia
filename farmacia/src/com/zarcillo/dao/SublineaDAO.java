package com.zarcillo.dao;

import com.zarcillo.domain.Sublinea;
import java.util.List;

/**
 *
 * @author saisa
 */

public interface SublineaDAO {
    Sublinea busqueda(Integer idsublinea);
    List<Sublinea> listaGeneral();
}
