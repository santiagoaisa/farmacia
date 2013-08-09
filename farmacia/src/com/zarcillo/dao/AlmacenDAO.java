package com.zarcillo.dao;

import com.zarcillo.domain.Almacen;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AlmacenDAO {
    Almacen busqueda(Integer idalmacen);
     List<Almacen> listaPorClogin(String clogin);
     List<Almacen> listaGeneral();
}
