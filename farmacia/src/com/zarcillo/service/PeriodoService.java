package com.zarcillo.service;

import com.zarcillo.domain.Periodo;
import com.zarcillo.negocio.Año;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface PeriodoService {
    
    public Periodo registrar(Periodo periodo);
    public Periodo actualizar(Periodo periodo);
    public void eliminar(Periodo periodo);
    public Periodo buscar(Integer idperiodo);
    public List<Periodo> listaGeneral();
    public List<Periodo> listaPeriodoAños();
    public List<Año> listaAños();
    public Periodo buscarPorNanoPorNmes(Integer nano,Integer nmes);
    public Periodo buscarPorDfecha(Date dfecha);
    
}
