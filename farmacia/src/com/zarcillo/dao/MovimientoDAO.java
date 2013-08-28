package com.zarcillo.dao;

import com.zarcillo.domain.Movimiento;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MovimientoDAO {
    List<Movimiento> listaPorIdregsalida(Integer idregsalida);
    List<Movimiento> listaPorIdregentrada(Integer idregentrada);
    List<Movimiento> listaPorIdunidadPorFechasVenta(Integer idunidad,Date dfecha1,Date dfecha2);
}
