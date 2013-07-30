package com.zarcillo.service;

import com.zarcillo.domain.Sublinea;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface SublineaService {

    public Sublinea registrar(Sublinea sublinea);
    public Sublinea actualizar(Sublinea sublinea);
    public void eliminar(Sublinea sublinea);
    public Sublinea buscar(Integer idsublinea);
    public List<Sublinea> listaGeneral();
    
}
