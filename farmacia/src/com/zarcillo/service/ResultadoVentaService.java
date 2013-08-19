package com.zarcillo.service;

import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.estadistica.VentaPorProducto;
import java.util.Date;
import java.util.List;

public interface ResultadoVentaService {
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidadPorFechas(Integer idunidad,Date fecha1,Date fecha2);
    public List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorFechas(Integer idunidad,Date fecha1,Date fecha2);
    public List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorFechas(Integer idunidad,Integer idvendedor,Date fecha1,Date fecha2);
}
