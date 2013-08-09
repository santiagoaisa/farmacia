package com.zarcillo.dao;

import com.zarcillo.domain.TipoCuentaBancaria;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoCuentaBancariaDAO {
      TipoCuentaBancaria busqueda(Integer idtipo);
      List<TipoCuentaBancaria> listaGeneral();
}
