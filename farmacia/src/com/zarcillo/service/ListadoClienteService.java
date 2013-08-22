package com.zarcillo.service;

import com.zarcillo.dto.creditos.CronogramaCobro;
import com.zarcillo.dto.creditos.DetalleCronogramaCobroCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoClienteService {

    public List<CronogramaCobro> listaCronogramaCobro();
    public List<DetalleCronogramaCobroCliente> listaDetalleCronogramaCobro();
    
}
