package com.zarcillo.service;

import com.zarcillo.domain.Periodo;
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
    
}
