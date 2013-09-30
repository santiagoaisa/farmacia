package com.zarcillo.service;

import com.zarcillo.domain.BarraHerramienta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface BarraHerramientaService {
     public BarraHerramienta registrar(BarraHerramienta barra);
    public BarraHerramienta actualizar(BarraHerramienta barra);
    public void eliminar(BarraHerramienta barra);
    public BarraHerramienta buscar(Integer idbarra);
    public List<BarraHerramienta> listaGeneral();    
}
