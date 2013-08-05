package com.zarcillo.dao;

import com.zarcillo.domain.Descuento;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public interface DescuentoDAO {
    Descuento busquedaPorIdalmacenPorIdproducto(Integer idalmacen,String idproducto);
    BigDecimal maximoDescuento(Integer idalmacen,String idproducto);
}
