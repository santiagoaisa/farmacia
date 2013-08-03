package com.zarcillo.service;

import com.zarcillo.domain.Menu;
import com.zarcillo.tipo.BarraMenu;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MenuService {
     public Menu registrar(Menu menu);
    public Menu actualizar(Menu menu);
    public void eliminar(Menu menu);
    public Menu buscar(Integer idmenu);
    
    public List<BarraMenu> listaBarraMenu();
    
    public List<Menu> listaPorIdmoduloMenuArchivo(Integer idmodulo);
    public List<Menu> listaPorIdmoduloMenuProceso(Integer idmodulo);
    public List<Menu> listaPorIdmoduloMenuConsulta(Integer idmodulo);
    public List<Menu> listaPorIdmoduloMenuHerramienta(Integer idmodulo);
}
