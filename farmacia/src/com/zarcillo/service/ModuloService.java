package com.zarcillo.service;

import com.zarcillo.domain.Modulo;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ModuloService {
      public Modulo registrar(Modulo modulo);
    public Modulo actualizar(Modulo modulo);
    public void eliminar(Modulo modulo);
    public Modulo buscar(Integer idmodulo);
    public List<Modulo> listaGeneral();
}
