package com.zarcillo.service;

import com.zarcillo.domain.Aval;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AvalService {
    
         public Aval registrar(Aval aval);
    public Aval actualizar(Aval aval);
    public void eliminar(Aval aval);
    public Aval buscar(Integer idaval);
    public List<Aval> listaPorIdcliente(Integer idcliente);
    
}
