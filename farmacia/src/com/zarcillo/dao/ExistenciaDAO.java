package com.zarcillo.dao;

import com.zarcillo.domain.Existencia;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ExistenciaDAO {
    void registrar(Existencia existencia);
     Existencia buscarPorIdalmacenPorIdproducto(Integer idalmacen,String idproducto);
     List<Existencia> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen, String ccriterio);  
     List<Existencia> busquedaListaPorIdalmacenPorReceta(Integer idalmacen, String ccriterio);  
     List<Existencia> listaPorIdalmacenPorBinafecto(Integer idalmacen);
     List<Existencia> listaPorIdalmacenPorIdlinea(Integer idalmacen, Integer idlinea);
     List<Existencia> listaPorIdalmacenPorLineasConStock(Integer idalmacen,List<Integer> lista);
}
