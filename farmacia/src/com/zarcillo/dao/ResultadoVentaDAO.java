package com.zarcillo.dao;

import com.zarcillo.dto.venta.VentaPorProducto;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ResultadoVentaDAO {    
    List<VentaPorProducto> listaVentaPorProductoPorIdunidaPorFechas(Integer idunidad,Date fecha1,Date fecha2);    
}
