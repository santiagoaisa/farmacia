package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotaboProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotaboProveedorDAO {
       MotivoNotaboProveedor busqueda(Integer idmotivo);
       List<MotivoNotaboProveedor> listaGeneral();
}
