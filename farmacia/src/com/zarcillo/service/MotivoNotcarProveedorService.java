package com.zarcillo.service;

import com.zarcillo.domain.MotivoNotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotcarProveedorService {
     public MotivoNotcarProveedor registrar(MotivoNotcarProveedor motivo);
    public MotivoNotcarProveedor actualizar(MotivoNotcarProveedor motivo);
    public void eliminar(MotivoNotcarProveedor motivo);
    public MotivoNotcarProveedor buscar(Integer idmotivo);
    public List<MotivoNotcarProveedor> listaGeneral();
}
