package com.zarcillo.dao;

import com.zarcillo.domain.Banco;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface BancoDAO {
    Banco busqueda(Integer idbanco);
    List<Banco> listaGeneral();
}
