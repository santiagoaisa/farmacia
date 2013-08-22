package com.zarcillo.dao;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.LetraCliente;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface LetraClienteDAO {
    LetraCliente buscarPorIdletra(Integer idletra); 
    List<LetraCliente> listaPendientesPorFechasPendientes(Date dfecha1,Date dfecha2);
}
