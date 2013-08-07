package com.zarcillo.dao;

import com.zarcillo.dto.almacen.Kardex;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface KardexDAO {
    
    List<Kardex> listaEntradaPorIdalmacenPorIdproductoPorIdperiodo(Integer idalmacen,String idproducto,Integer idperiodo);
    List<Kardex> listaSalidaPorIdalmacenPorIdproductoPorIdperiodo(Integer idalmacen,String idproducto,Integer idperiodo);
    
}
