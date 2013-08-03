package com.zarcillo.dao;

import com.zarcillo.domain.Mapa;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MapaDAO {
    List<Mapa> listaPorIdrolPorIdmodulo(Integer idrol,Integer idmodulo);
    List<Mapa> listaPorIdrolPorIdmoduloPorNnivel(Integer idrol,Integer idmodulo,Integer nnivel);
    
     List<Mapa> listaEncabezado(Integer idrol,Integer idmodulo);
    List<Mapa> listaMenu(Integer idrol, Mapa mapa);
    List<Mapa> listaSubmenu(Integer idrol, Mapa mapa);  
}
