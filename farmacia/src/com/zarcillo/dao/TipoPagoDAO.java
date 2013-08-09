package com.zarcillo.dao;

import com.zarcillo.domain.TipoPago;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface TipoPagoDAO {
     TipoPago busqueda(Integer idtipo);
     List<TipoPago> listaTipoPagoPorBcobro();
     List<TipoPago> listaTipoPagoPorBpago();
     TipoPago buscarPorCcodigosunat(String ccodigosunat);
     List<TipoPago> listaGeneral();
}
