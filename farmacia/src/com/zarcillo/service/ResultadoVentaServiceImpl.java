package com.zarcillo.service;

import com.zarcillo.dao.AnulacionDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.dto.anulacion.Correlativo;
import com.zarcillo.dto.anulacion.CorrelativoComprobante;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.estadistica.VentaPorProducto;
import com.zarcillo.negocio.Igv;
import com.zarcillo.util.ordenar.OrdenarPorDfecemiPorIddocumentoPorCseriePorCnumeroVentaPorDocumento;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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
    @Autowired
    private AnulacionDAO anulaciondao;
    @Autowired
    private DocumentoDAO documentodao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;

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

    @Override
    public List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        List<Correlativo> listaAnulados = new ArrayList<>();
        List<Documento> listaDocumento = new ArrayList<>();

        List<VentaPorDocumento> listaVenta = resultadoventadao.listaVentaPorDocumentoPorIdunidadPorFechas(idunidad, fecha1, fecha2);
        for (VentaPorDocumento vd : listaVenta) {
            if (!listaDocumento.contains(vd.getIddocumento())) {
                listaDocumento.add(vd.getIddocumento());
            }
        }

        for (Documento d : listaDocumento) {
            List<String> listaSerie = anulaciondao.listaSeriesPorIdunidadPorIddocumentoPorFechas(idunidad, d.getIddocumento(), fecha1, fecha2);

            for (String s : listaSerie) {
                String numerominimo = anulaciondao.minimoPorIddocumentoPorCserie(d.getIddocumento(), s, fecha1, fecha2);
                String numeromaximo = anulaciondao.maximoPorIddocumentoPorCserie(d.getIddocumento(), s, fecha1, fecha2);                
                listaAnulados.addAll(listaFaltantesComprobante(d, s, fecha1, fecha2, numerominimo, numeromaximo));
            }
        }

        VentaPorDocumento venta;
        CondicionVenta condicion = new CondicionVenta();
        condicion.setIdcondicion(999);
        condicion.setCnomcondicion("ANULADO");
        for (Correlativo c : listaAnulados) {
            venta = new VentaPorDocumento();
            venta.setIddocumento(c.getIddocumento());
            venta.setCserie(c.getCserie());
            venta.setCnumero(c.getCnumero());
            venta.setDfecemi(c.getDfecha());
            venta.setIdcondicion(condicion);
            listaVenta.add(venta);
        }

        Collections.sort(listaVenta, new OrdenarPorDfecemiPorIddocumentoPorCseriePorCnumeroVentaPorDocumento());

        return listaVenta;
    }

    private List<Correlativo> listaFaltantesComprobante(Documento documento, String serie, Date fecha1, Date fecha2, String cminimo, String cmaximo) {
        List<Correlativo> listaAnuladas = new ArrayList<>();
        List<CorrelativoComprobante> listaCorrelativo = comprobantedao.listaPorIddocumentoPorCseriePorFechas(documento.getIddocumento(), serie, fecha1, fecha2);
       
        
        Integer minimo = Integer.valueOf(cminimo.trim());
        Integer maximo = Integer.valueOf(cmaximo.trim());

        CorrelativoComprobante numero;
        Correlativo pendiente;

        DecimalFormat formato = new DecimalFormat("000000");
        Date fechaanulado = fecha1;
        for (int i = minimo; i < maximo; i++) {
            numero = new CorrelativoComprobante();

            String cnumero = formato.format(i);
            numero.setIddocumento(documento);
            numero.setCserie(serie);
            numero.setCnumero(cnumero);

            if (!listaCorrelativo.contains(numero)) {
                pendiente = new Correlativo();
                pendiente.setIddocumento(numero.getIddocumento());
                pendiente.setDfecha(fechaanulado);
                pendiente.setCserie(numero.getCserie());
                pendiente.setCnumero(numero.getCnumero());
                listaAnuladas.add(pendiente);
            } else {
                int index = listaCorrelativo.indexOf(numero);
                CorrelativoComprobante correlativo = listaCorrelativo.get(index);
                fechaanulado = correlativo.getDfecha();
            }
        }
        
        return listaAnuladas;
        
    }
}
