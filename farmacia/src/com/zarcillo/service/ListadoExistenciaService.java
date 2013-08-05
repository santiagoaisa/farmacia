package com.zarcillo.service;

import com.zarcillo.dto.almacen.Inventario;
import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.dto.almacen.InventarioValorizado;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoExistenciaService {
    public List<Inventario> listaInventarioPorIdalmacenPorLineas(Integer idalmacen,List<Integer> lista);
    public List<InventarioLote> listaInventarioLotePorIdalmacenPorLineas(Integer idalmacen,List<Integer> lista);
    public List<InventarioValorizado> listaInventarioValorizadoPorIdalmacen(Integer idalmacen);
}