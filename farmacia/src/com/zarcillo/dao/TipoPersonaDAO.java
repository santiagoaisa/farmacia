package com.zarcillo.dao;

import com.zarcillo.domain.TipoPersona;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoPersonaDAO {
    TipoPersona busqueda(Integer idtipo);
    List<TipoPersona> listaGeneral();
}
