package com.zarcillo.service;

import com.zarcillo.domain.MotivoAnulacion;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.venta.DetalleVenta;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RegistroSalidaService {
    public void reemplazarNumeracion(Integer idregsalida,String cserie,String cnumero);
    public List<DetalleVenta> listaDetalleSalida(Integer idregsalida); 
    public RegistroSalida buscarPorIdunidadPorIdregsalida(Integer idunidad,Integer idregsalida);
    public RegistroSalida buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunineg, Integer iddocumento, String serie, String numero);
    public List<RegistroSalida> listaPorIdunidadPorMotivoPorFechas(Integer idunidad,Integer idmotivo,Date dfecha1,Date dfecha2);
    
}
