package com.zarcillo.service;

import com.zarcillo.domain.Presentacion;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface PresentacionService {
      public Presentacion registrar(Presentacion presentacion);
    public Presentacion actualizar(Presentacion presentacion);
    public void eliminar(Presentacion presentacion);
    public Presentacion buscar(Integer idpresentacion);
    public List<Presentacion> listaGeneral();
}
