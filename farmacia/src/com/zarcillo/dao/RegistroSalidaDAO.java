package com.zarcillo.dao;

import com.zarcillo.domain.RegistroSalida;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RegistroSalidaDAO {
    List<RegistroSalida> listaPorIdunidadPorIdmotivoPorFechas(Integer idunidad,Integer idmotivo,Date dfecha1,Date dfecha2);
    RegistroSalida  buscarPorIdregsalida(Integer idregsalida);
    RegistroSalida  buscarPorIdunidadIdregsalida(Integer idunidad,Integer idregsalida);
}
