package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.dao.TipoPagoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.dto.caja.CobroPorDocumento;
import com.zarcillo.dto.caja.ResumenCobroPorFecha;
import com.zarcillo.negocio.Dia;
import java.math.BigDecimal;
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
@Service("planillaIngresoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PlanillaIngresoServiceImpl implements PlanillaIngresoService {

    @Autowired
    private ResultadoVentaDAO resultadodao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private TipoPagoDAO tipopagodao;

    @Override
    public List<CobroPorDocumento> listaCobroPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad, Integer idusuario, Date fecha1, Date fecha2) {
        List<CobroPorDocumento> listaCobro = resultadodao.listaVentaPorDocumentoPorIdunidadPorIdusuarioPorFechas(idunidad, idusuario, fecha1, fecha2);
        List<CobroPorDocumento> listaRetorno = new ArrayList<>();

        CobroPorDocumento cobro;
        List<AmortizacionCliente> listaAmortizacion;
        ComprobanteEmitido comprobante;

        BigDecimal ntotal;
        BigDecimal nefectivo;
        BigDecimal ntcredito;
        BigDecimal ntdebito;
        for (CobroPorDocumento c : listaCobro) {
            cobro = new CobroPorDocumento();
            cobro.setId(c.getId());
            cobro.setIdcondicion(c.getIdcondicion());
            cobro.setIddocumento(c.getIddocumento());
            cobro.setIdregsalida(c.getIdregsalida());
            cobro.setCserie(c.getCserie());
            cobro.setCnumero(c.getCnumero());
            cobro.setDfecemi(c.getDfecemi());
            cobro.setNimporte(c.getNimporte());
            cobro.setNacuenta(c.getNacuenta());
            cobro.setNsaldo(c.getNsaldo());

            comprobante = comprobantedao.buscarPorIdregsalida(c.getIdregsalida());
            listaAmortizacion = amortizaciondao.listaPorIdcomprobante(comprobante.getIdcomprobante());

            nefectivo = new BigDecimal("0");
            ntcredito = new BigDecimal("0");
            ntdebito = new BigDecimal("0");
            ntotal = new BigDecimal("0");
            for (AmortizacionCliente a : listaAmortizacion) {

                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.EFECTIVO_SUNAT.getCcodigosunat())) {
                    nefectivo = nefectivo.add(a.getNimportes());
                }
                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.TARJETA_CREDITO_SUNAT.getCcodigosunat())) {
                    ntcredito = ntcredito.add(a.getNimportes());
                }
                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.TARJETA_DEBITO_SUNAT.getCcodigosunat())) {
                    ntdebito = ntdebito.add(a.getNimportes());
                }

            }

            ntotal = nefectivo.add(ntcredito).add(ntdebito);
            cobro.setNefectivo(nefectivo);
            cobro.setNtcredito(ntcredito);
            cobro.setNtdebito(ntdebito);
            cobro.setNtotal(ntotal);

            if (!listaRetorno.contains(cobro)) {
                listaRetorno.add(cobro);
            }

        }

        return listaRetorno;
    }

    @Override
    public List<ResumenCobroPorFecha> listaResumenCobroPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        List<ResumenCobroPorFecha> listaRetorno = new ArrayList<>();
        List<Date> listaFechas = Dia.listaFechas(fecha1, fecha2);

        TipoPago EFECTIVO = tipopagodao.buscarPorCcodigosunat(TipoPago.EFECTIVO_SUNAT.getCcodigosunat());
        TipoPago TARJETA_CREDITO = tipopagodao.buscarPorCcodigosunat(TipoPago.TARJETA_CREDITO_SUNAT.getCcodigosunat());
        TipoPago TARJETA_DEBITO = tipopagodao.buscarPorCcodigosunat(TipoPago.TARJETA_DEBITO_SUNAT.getCcodigosunat());

        List<Integer> listaId = new ArrayList<>();
        listaId.add(EFECTIVO.getIdtipo());
        listaId.add(TARJETA_CREDITO.getIdtipo());
        listaId.add(TARJETA_DEBITO.getIdtipo());


        List<AmortizacionCliente> listaAmortizacion;
        BigDecimal nefectivo;
        BigDecimal ntcredito;
        BigDecimal ntdebito;
        BigDecimal ntotal;
        ResumenCobroPorFecha resumen;
        for (Date d : listaFechas) {
            resumen = new ResumenCobroPorFecha();
            resumen.setDfecha(d);
            listaAmortizacion = amortizaciondao.listaPorFechas(d, d, listaId);

            nefectivo = new BigDecimal("0");
            ntcredito = new BigDecimal("0");
            ntdebito = new BigDecimal("0");
            ntotal = new BigDecimal("0");

            for (AmortizacionCliente a : listaAmortizacion) {
                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.EFECTIVO_SUNAT.getCcodigosunat())) {
                    nefectivo = nefectivo.add(a.getNimportes());
                }
                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.TARJETA_CREDITO_SUNAT.getCcodigosunat())) {
                    ntcredito = ntcredito.add(a.getNimportes());
                }
                if (a.getIdtipo().getCcodigosunat().contains(TipoPago.TARJETA_DEBITO_SUNAT.getCcodigosunat())) {
                    ntdebito = ntdebito.add(a.getNimportes());
                }
            }

            resumen.setNefectivo(nefectivo);
            resumen.setNtcredito(ntcredito);
            resumen.setNtdebito(ntdebito);
            ntotal=nefectivo.add(ntcredito).add(ntdebito);
            resumen.setNtotal(ntotal);
            listaRetorno.add(resumen);
        }

        return listaRetorno;
    }
}
