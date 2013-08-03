package com.zarcillo.dao;

import com.zarcillo.domain.Menu;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MenuDAO {
     Menu busqueda(Integer idmenu);
     List<Menu> listaPorIdmodulo(Integer idmodulo);
     List<Menu> listaPorIdmoduloPorNnivel1(Integer idmodulo,Integer nnivel);
}
