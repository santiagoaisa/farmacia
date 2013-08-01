package com.zarcillo.service;

import com.zarcillo.domain.TipoCuentaBancaria;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoCuentaBancariaService {
     public TipoCuentaBancaria registrar(TipoCuentaBancaria tipo);
    public TipoCuentaBancaria actualizar(TipoCuentaBancaria tipo);
    public void eliminar(TipoCuentaBancaria tipo);
    public TipoCuentaBancaria buscar(Integer idtipo);
    public List<TipoCuentaBancaria> listaGeneral();
}
