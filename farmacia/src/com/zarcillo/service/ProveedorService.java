package com.zarcillo.service;

import com.zarcillo.domain.Proveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ProveedorService {
    
      public Proveedor registrar(Proveedor proveedor);
    public Proveedor actualizar(Proveedor proveedor);
    public void eliminar(Proveedor proveedor);
    public Proveedor buscar(Integer idproveedor);
    public List<Proveedor> listaGeneral();
    
}
