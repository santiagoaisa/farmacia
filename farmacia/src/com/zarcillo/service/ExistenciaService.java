package com.zarcillo.service;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Producto;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ExistenciaService {
    public Existencia registrar(Almacen idalmacen,Producto idproducto);
    public Existencia actualizar(Existencia existencia);
    public Existencia buscarPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto);
    public Descuento  buscarDescuentoPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto);
    public Existencia actualizar(Existencia existencia,Descuento descuento);
    public Integer actualizaTemporal(Existencia existencia);
    public List<Existencia> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen,String criterio);
    
    public List<Existencia> listaPorIdalmacenInafectos(Integer idalmacen);
    public List<Existencia> listaPorIdalmacenPorIdlinea(Integer idalmacen, Integer idlinea);
}
