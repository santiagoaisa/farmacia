package com.zarcillo.service;

import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.domain.Periodo;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.estadistica.VentaPorProducto;
import com.zarcillo.negocio.Igv;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

/**
 *
 * @author saisa
 */
@Service("resultadoVentaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ResultadoVentaServiceImpl implements ResultadoVentaService {

    @Autowired
    private ResultadoVentaDAO resultadoventadao;
    @Autowired
    private PeriodoDAO periododao;

    @Override
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidadPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        List<VentaPorProducto> listaVenta = resultadoventadao.listaVentaPorProductoPorIdunidaPorFechas(idunidad, fecha1, fecha2);
        List<VentaPorProducto> listaRetorno = new ArrayList<>();
        VentaPorProducto venta;
        for (VentaPorProducto v : listaVenta) {
            venta = new VentaPorProducto();
            venta.setIdproducto(v.getIdproducto());
            venta.setIdalmacen(v.getIdalmacen());
            venta.setNsubcos(v.getNsubcos());
            venta.setNsubtot(v.getNsubtot());
            venta.setNentero(v.getNentero());
            venta.setNfraccion(v.getNfraccion());
            venta.setNprecio(Igv.importeDetalleVenta(v.getNsubtot(), v.getIdproducto().getBinafecto()));
            venta.setNprecos(Igv.importeDetalleVenta(v.getNsubcos(), v.getIdproducto().getBinafecto()));
            venta.calculaUtilidad();

            listaRetorno.add(venta);
        }

        return listaRetorno;

    }

    @Override
    public List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorFechas(Integer idunidad, Integer idvendedor, Date fecha1, Date fecha2) {
        return resultadoventadao.listaVentaPorDocumentoPorIdunidadPorIdvendedorPorFechas(idunidad, idvendedor, fecha1, fecha2);
    }
}
