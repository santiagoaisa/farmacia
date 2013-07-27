package com.zarcillo.service;

import com.zarcillo.domain.Moneda;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MonedaService {
      public Moneda registrar(Moneda moneda);
    public Moneda actualizar(Moneda moneda);
    public void eliminar(Moneda moneda);
    public Moneda buscar(Integer idmoneda);
    public List<Moneda> listaGeneral();
}
