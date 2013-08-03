package com.zarcillo.service;

import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Rol;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MapaService {
    public void  registrar(Rol rol,Integer idmodulo);
     public List<Mapa> listaPorIdrolPorIdmoduloMenuArchivo(Integer idrol,Integer idmodulo);
    public List<Mapa> listaPorIdrolPorIdmoduloMenuProceso(Integer idrol,Integer idmodulo);
    public List<Mapa> listaPorIdrolPorIdmoduloMenuConsulta(Integer idrol,Integer idmodulo);
    public List<Mapa> listaPorIdrolPorIdmoduloMenuHerramienta(Integer idrol,Integer idmodulo);
    
     public List<Mapa> listaEncabezado(Integer idrol,Integer idmodulo);
     public List<Mapa> listaMenu(Integer idrol,Mapa mapa);
     public List<Mapa> listaSubmenu(Integer idrol,Mapa mapa);
}
