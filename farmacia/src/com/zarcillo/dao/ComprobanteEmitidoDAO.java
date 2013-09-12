package com.zarcillo.dao;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.dto.anulacion.CorrelativoComprobante;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ComprobanteEmitidoDAO {
    ComprobanteEmitido buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunidad,Integer iddocumento,String cserie, String cnumero);
    ComprobanteEmitido buscarPorIdregsalida(Integer idregsalida);    
    ComprobanteEmitido buscarPorIdcomprobante(Integer idcomprobante);    
    List<ComprobanteEmitido> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano);
    List<ComprobanteEmitido> listaPendientesPorFechasPendientes(Date dfecha1,Date dfecha2);
    
    List<CorrelativoComprobante> listaPorIddocumentoPorCseriePorFechas(Integer iddocumento,String cserie,Date fecha1,Date fecha2);
}
