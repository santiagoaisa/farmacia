package com.zarcillo.dao;

import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.dto.almacen.InventarioValorizado;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoExistenciaDAO {
    List<InventarioLote> listaPorIdalmacenPorLineasConStock(Integer idalmacen,List<Integer> lista);
}
