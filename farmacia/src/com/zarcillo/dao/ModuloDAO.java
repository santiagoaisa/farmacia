package com.zarcillo.dao;

import com.zarcillo.domain.Modulo;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ModuloDAO {
    Modulo busqueda(Integer idmodulo);
    List<Modulo> listaPorIdrol(Integer idrol);
}
