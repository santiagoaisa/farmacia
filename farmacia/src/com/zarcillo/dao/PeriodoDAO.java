package com.zarcillo.dao;

import com.zarcillo.domain.Periodo;
import java.util.Date;

/**
 *
 * @author saisa
 */
public interface PeriodoDAO {    
    Periodo busqueda(Integer idperiodo);
    Periodo buscarPorNanoPorNmes(Integer nano,Integer nmes);
    Periodo buscarPorFecha(Date dfecha);
}
