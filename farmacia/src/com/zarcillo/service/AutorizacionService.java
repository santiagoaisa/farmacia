package com.zarcillo.service;

import com.zarcillo.domain.Autorizacion;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AutorizacionService {
    public Autorizacion registrar(Autorizacion autorizacion);
    public Autorizacion actualizar(Autorizacion autorizacion);
    public void eliminar(Autorizacion autorizacion);
    public Autorizacion buscar(Integer idautorizacion);
    public List<Autorizacion> listaGeneral();
}
