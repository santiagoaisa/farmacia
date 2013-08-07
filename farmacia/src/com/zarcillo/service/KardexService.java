package com.zarcillo.service;

import com.zarcillo.dto.almacen.Kardex;
import com.zarcillo.dto.almacen.TotalKardex;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface KardexService {
    
     public List<Kardex> listaKardex(Integer idalmacen,String idproducto,Integer idperiodo);
    public TotalKardex busquedaKardex(Integer idalmacen,String idproducto,Integer idperiodo);
    
}
