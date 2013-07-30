package com.zarcillo.service;

import com.zarcillo.domain.TipoPersona;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoPersonaService  {
    
    public TipoPersona registrar(TipoPersona tipo);
    public TipoPersona actualizar(TipoPersona tipo);
    public void eliminar(TipoPersona tipo);
    public TipoPersona buscar(Integer idtipo);
    public List<TipoPersona> listaGeneral();
    
}
