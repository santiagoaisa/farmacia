package com.zarcillo.dao;

import com.zarcillo.domain.HistoricoExistencia;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface HistoricoExistenciaDAO {
    List<HistoricoExistencia>  listaPorIdperiodoPorIdalmacenPorIdlinea(Integer idperiodo,Integer idalmacen,Integer idlinea);
}
