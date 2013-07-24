package com.zarcillo.dao;

import com.zarcillo.domain.Rol;
import java.util.List;

public interface RolDAO {
    void registrar(Rol rol);
    List<Rol> lista();
}
