package com.zarcillo.service;

import com.zarcillo.domain.Linea;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LineaService {
    
    public Linea registrar(Linea linea);
    public Linea actualizar(Linea linea);
    public void eliminar(Linea linea);
    public Linea buscar(Integer idlinea);
    public List<Linea> listaGeneral();
    public List<Linea> listaActivos();
    public List<Linea> listaConStock(Integer idalmacen);
    
}
