package com.zarcillo.dao;

import com.zarcillo.domain.Rol;
import java.util.List;

public interface RolDAO {
    Rol busqueda(Integer idrol);
    List<Rol> listaGeneral();
}
