package com.zarcillo.dao;

import com.zarcillo.domain.Numeracion;

/**
 *
 * @author saisa
 */
public interface NumeracionDAO {
    public Numeracion incrementar(Integer idunineg,Integer iddocumento);
    public Numeracion buscarPorIdunidadPorIddocumento(Integer idunidad,Integer iddocumento);
    public Numeracion buscarPorIddocumentoPorCserie(Integer idunidad,Integer iddocumento,Integer cserie);
    public Numeracion buscarPorIdnumeracion(Integer idnumeracion);
    
}
