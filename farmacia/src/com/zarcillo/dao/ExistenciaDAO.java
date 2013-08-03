package com.zarcillo.dao;

import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.ExistenciaPK;

/**
 *
 * @author saisa
 */
public interface ExistenciaDAO {
    void registrar(Existencia existencia);
     Existencia buscarPorIdalmacenPorIdproducto(Integer idalmacen,String idproducto);
}
