package com.zarcillo.dao;

import com.zarcillo.domain.Familia;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface FamiliaDAO {
    Familia busqueda(Integer idfamilia);
    List<Familia> listaGeneral();
}
