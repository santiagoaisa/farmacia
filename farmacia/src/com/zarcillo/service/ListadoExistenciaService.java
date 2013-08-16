package com.zarcillo.service;

import com.zarcillo.dto.compra.ActualizarExistencia;
import com.zarcillo.dto.compra.ExistenciaValorizada;
import com.zarcillo.dto.almacen.Inventario;
import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.dto.almacen.InventarioValorizado;
import com.zarcillo.dto.venta.ListadoPrecio;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoExistenciaService {
    public List<ListadoPrecio> listadoPrecio(Integer idalmacen,List<Integer> lista);
    public List<Inventario> listaInventarioPorIdalmacenPorLineas(Integer idalmacen,List<Integer> lista);
    public List<InventarioLote> listaInventarioLotePorIdalmacenPorLineas(Integer idalmacen,List<Integer> lista);
    public List<InventarioValorizado> listaInventarioValorizadoPorIdalmacen(Integer idalmacen);
    public List<ExistenciaValorizada> listaExistenciaValorizadaPorIdalmacenPorIdlinea(Integer idalmacen,Integer idlinea);
    public List<ActualizarExistencia> listaActualizarPrecioPorDescripcion(Integer idalmacen,String criterio);
    public void actualizarPrecio(ActualizarExistencia actualizar);
}
