package com.zarcillo.service;

import com.zarcillo.domain.MotivoNotcarCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotcarClienteService {
      public MotivoNotcarCliente registrar(MotivoNotcarCliente motivo);
    public MotivoNotcarCliente actualizar(MotivoNotcarCliente motivo);
    public void eliminar(MotivoNotcarCliente motivo);
    public MotivoNotcarCliente buscar(Integer idmotivo);
    public List<MotivoNotcarCliente> listaGeneral();
}
