package com.zarcillo.dao;

import com.zarcillo.domain.Rol;
import java.util.List;

public interface RolDAO {
    public void registrar(Rol rol);
    public List<Rol> lista();
}
