package com.zarcillo.service;

import com.zarcillo.domain.Rol;
import java.util.List;

public interface RolService {
     public void registrar(Rol rol);
     public List<Rol> listaRoles();
}
