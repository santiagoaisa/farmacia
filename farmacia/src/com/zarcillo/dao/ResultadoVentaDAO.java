package com.zarcillo.dao;

import com.zarcillo.dto.caja.CobroPorDocumento;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.estadistica.VentaPorProducto;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ResultadoVentaDAO {    
    List<CobroPorDocumento> listaVentaPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad,Integer idusuario,Date fecha1,Date fecha2);
    List<VentaPorProducto> listaVentaPorProductoPorIdunidaPorFechas(Integer idunidad,Date fecha1,Date fecha2);    
    List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorIdvendedorPorFechas(Integer idunidad,Integer idvendedor,Date fecha1,Date fecha2);  
    
}
