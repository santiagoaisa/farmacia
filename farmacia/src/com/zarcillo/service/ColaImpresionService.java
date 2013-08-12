package com.zarcillo.service;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.Usuario;

/**
 *
 * @author saisa
 */
public interface ColaImpresionService {
    
    public ComprobanteEmitido crearDocumento(RegistroSalida regsalida, TipoPago tipo,Usuario usuario) ;
    
}
