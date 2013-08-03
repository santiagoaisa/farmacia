package com.zarcillo.dao;

import com.zarcillo.domain.Lote;

/**
 *
 * @author saisa
 */
public interface LoteDAO {
     Lote buscarPorIdalmacenPorIdproductoPorClote(Integer idalmacen,String idproducto,String clote);
}
