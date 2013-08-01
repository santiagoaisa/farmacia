package com.zarcillo.dao;

import com.zarcillo.domain.Aval;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AvalDAO {
    Aval busqueda(Integer idaval);
    List<Aval> listaPorIdcliente(Integer idcliente);
}
