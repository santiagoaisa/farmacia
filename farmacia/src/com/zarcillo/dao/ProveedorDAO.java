package com.zarcillo.dao;

import com.zarcillo.domain.Proveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ProveedorDAO {
      Proveedor busqueda(Integer idproveedor);
      List<Proveedor> busquedaListaPorCnomprovee(String ccriterio);
      List<Proveedor> listaGeneral();
}
