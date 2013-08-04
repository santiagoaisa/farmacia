package com.zarcillo.service;

import com.zarcillo.domain.TipoPago;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoPagoService {
      public TipoPago registrar(TipoPago tipo);
    public TipoPago actualizar(TipoPago tipo);
    public void eliminar(TipoPago tipo);
    public TipoPago buscar(Integer idtipo);
    public List<TipoPago> listaGeneral();
    public List<TipoPago> listaTipoPagoCliente();
    public List<TipoPago> listaTipoPagoProveedor();
}
