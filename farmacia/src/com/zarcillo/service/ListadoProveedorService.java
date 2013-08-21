package com.zarcillo.service;

import com.zarcillo.dto.finanzas.CronogramaPago;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ListadoProveedorService {
    public List<CronogramaPago> listaCronogramaPago(Date dhasta);
    public List<DetalleCronogramaPagoProveedor> listaDetalleCronogramaPago(Date dhasta);
    
    
}
