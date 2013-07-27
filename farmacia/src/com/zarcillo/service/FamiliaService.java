package com.zarcillo.service;

import com.zarcillo.domain.Familia;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface FamiliaService {
     public Familia registrar(Familia familia);
    public Familia actualizar(Familia familia);
    public void eliminar(Familia familia);
    public Familia buscar(Integer idfamilia);
    public List<Familia> listaGeneral();
}
