package com.zarcillo.dao;

import com.zarcillo.domain.UnidadNegocio;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface UnidadNegocioDAO {
     UnidadNegocio busqueda(Integer idunidad);
     List<UnidadNegocio> listaPorClogin(String clogin);
     List<UnidadNegocio> listaGeneral();
}
