package com.zarcillo.service;

import com.zarcillo.dto.venta.VentaPorProducto;
import java.util.Date;
import java.util.List;

public interface ResultadoVentaService {
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidadPorFechas(Integer idunidad,Date fecha1,Date fecha2);
}
