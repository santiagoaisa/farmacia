package com.zarcillo.service;

import com.zarcillo.dto.caja.CobroPorDocumento;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface PlanillaIngresoService {
    public List<CobroPorDocumento> listaCobroPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad,Integer idusuario,Date fecha1,Date fecha2);
}
