package com.zarcillo.service;

import com.zarcillo.domain.MotivoNotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotaboProveedorService {
      public MotivoNotaboProveedor registrar(MotivoNotaboProveedor motivo);
    public MotivoNotaboProveedor actualizar(MotivoNotaboProveedor motivo);
    public void eliminar(MotivoNotaboProveedor motivo);
    public MotivoNotaboProveedor buscar(Integer idmotivo);
    public List<MotivoNotaboProveedor> listaGeneral();
}
