package com.zarcillo.dao;

import com.zarcillo.domain.RegistroSalida;

/**
 *
 * @author saisa
 */
public interface RegistroSalidaDAO {
    RegistroSalida  buscarPorIdregsalida(Integer idregsalida);
    RegistroSalida  buscarPorIdunidadIdregsalida(Integer idunidad,Integer idregsalida);
}
