package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotcarProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotcarProveedorDAO {
    MotivoNotcarProveedor busqueda(Integer idmotivo);
    List<MotivoNotcarProveedor> listaGeneral();
}
