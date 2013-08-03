package com.zarcillo.service;

import com.zarcillo.domain.UnidadNegocio;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface UnidadNegocioService {
    
     public UnidadNegocio registrar(UnidadNegocio unidad);
    public UnidadNegocio actualizar(UnidadNegocio unidad);
    public void eliminar(UnidadNegocio unidad);
    public UnidadNegocio buscar(Integer idunidad);
    public List<UnidadNegocio> listaGeneral();
    public List<UnidadNegocio> listaPorClogin(String clogin);
}
