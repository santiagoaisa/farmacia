package com.zarcillo.service;

import com.zarcillo.domain.Rol;
import java.util.List;

public interface RolService {
    
     public Rol registrar(Rol rol);
    public Rol actualizar(Rol rol);
    public void eliminar(Rol rol);
    public Rol buscar(Integer idrol);
    public List<Rol> listaGeneral();
    
    
}
