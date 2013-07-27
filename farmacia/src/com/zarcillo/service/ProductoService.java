package com.zarcillo.service;

import com.zarcillo.domain.Producto;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ProductoService {
  public Producto registrar(Producto producto);
    public Producto actualizar(Producto producto);
    public void eliminar(Producto producto);
    public Producto buscar(Integer idproducto);
    public List<Producto> listaGeneral();   
}
