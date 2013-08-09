package com.zarcillo.dao;

import com.zarcillo.domain.Periodo;
import com.zarcillo.negocio.Año;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface PeriodoDAO {    
    Periodo busqueda(Integer idperiodo);
    Periodo buscarPorNanoPorNmes(Integer nano,Integer nmes);
    Periodo buscarPorFecha(Date dfecha);
    List<Año> listaAños();
    List<Periodo> listaGeneral();
}
