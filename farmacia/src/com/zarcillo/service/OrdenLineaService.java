package com.zarcillo.service;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.OrdenLinea;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface OrdenLineaService {
    public void registrar(Integer idunineg, List<OrdenLinea> lista);
    public List<Linea> listaPorIdunidadOrdenada(Integer idunidad);
    public List<Linea> listaPorIdunidadPendiente(Integer idunidad);
}
