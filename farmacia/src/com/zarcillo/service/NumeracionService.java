package com.zarcillo.service;

import com.zarcillo.dto.numeracion.Formato;

/**
 *
 * @author saisa
 */
public interface NumeracionService {    
     
    public Formato buscarPorIdunidadPorIddocumento(Integer idunineg,Integer iddocumento);
    public Formato buscarPorIdunidadPorIddocumentoPorCserie(Integer idunineg,Integer iddocumento,Integer cserie);
    public Formato actualizar(Formato formato);
    
    
}
