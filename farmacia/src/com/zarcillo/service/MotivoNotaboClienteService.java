package com.zarcillo.service;

import com.zarcillo.domain.MotivoNotaboCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotaboClienteService {
    
     public MotivoNotaboCliente registrar(MotivoNotaboCliente motivo);
    public MotivoNotaboCliente actualizar(MotivoNotaboCliente motivo);
    public void eliminar(MotivoNotaboCliente motivo);
    public MotivoNotaboCliente buscar(Integer idmotivo);
    public List<MotivoNotaboCliente> listaGeneral();
    
}
