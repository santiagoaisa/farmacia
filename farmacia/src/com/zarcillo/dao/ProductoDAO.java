package com.zarcillo.dao;

import com.zarcillo.domain.Producto;
import java.util.List;
/**
 *
 * @author saisa
 */
public interface ProductoDAO {
    Producto busqueda(String idproducto);      
    Producto busquedaPorCcodigobarra(String ccodigobarra);      
    List<Producto> busquedaListaPorDescripcion(String ccriterio);
    Integer numeroPorIdlinea(Integer idlinea);
}
