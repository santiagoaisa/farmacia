package com.zarcillo.service;

import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.dto.venta.DetalleVenta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RegistroSalidaService {
    
    public List<DetalleVenta> listaDetalleSalida(Integer idregsalida); 
    public RegistroSalida buscarPorIdunidadPorIdregsalida(Integer idunidad,Integer idregsalida);
    public RegistroSalida buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunineg, Integer iddocumento, String serie, String numero);
    
}