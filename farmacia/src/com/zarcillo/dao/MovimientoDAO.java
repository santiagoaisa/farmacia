package com.zarcillo.dao;

import com.zarcillo.domain.Movimiento;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MovimientoDAO {
    List<Movimiento> listaPorIdregsalida(Integer idregsalida);
    List<Movimiento> listaPorIdregentrada(Integer idregentrada);
}
