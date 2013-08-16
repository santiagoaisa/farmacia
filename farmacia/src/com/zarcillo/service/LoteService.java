package com.zarcillo.service;

import com.zarcillo.domain.Lote;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LoteService {
      public Lote registrar(Lote lote);
    public Lote actualizar(Lote lote);
    public void eliminar(Lote lote);
    public List<Lote> listaPorIdalmacenPorIdproducto(Integer idalmacen,String idproducto);
    public List<Lote> listaPorIdalmacenPorIdlineasPorVencimiento(Integer idalmacen,List<Integer> lista,Date fecha);
}
