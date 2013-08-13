package com.zarcillo.dao;

import com.zarcillo.domain.TipoPersona;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoPersonaDAO {
    TipoPersona busqueda(Integer idtipo);
    TipoPersona buscarPorCcodigoSunat(String ccodigo);
    List<TipoPersona> listaGeneral();
}
