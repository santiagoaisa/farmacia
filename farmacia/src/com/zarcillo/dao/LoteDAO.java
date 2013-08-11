package com.zarcillo.dao;

import com.zarcillo.domain.Lote;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LoteDAO {
     Lote buscarPorIdalmacenPorIdproductoPorCloteParaIngreso(Integer idalmacen,String idproducto,String clote);
     Lote buscarPorIdalmacenPorIdproductoPorCloteParaAnulacion(Integer idalmacen,String idproducto,String clote);
     Lote buscarPorIdalmacenPorIdproductoPorCloteParaVenta(Integer idalmacen,String idproducto,String clote);
     
     List<Lote> listaPorIdalmacenPorIdproductoParaVentaEntero(Integer idalmacen,String idproducto);
     List<Lote> listaPorIdalmacenPorIdproductoParaVentaFraccion(Integer idalmacen,String idproducto);
     
     List<Lote> listaPorIdalmacenPorIdproductoParaListado(Integer idalmacen,String idproducto);
     Integer cantidadBloqueadaPorIdalmacenPorIdproductoBloqueados(Integer idalmacen,String idproducto);
     
}
