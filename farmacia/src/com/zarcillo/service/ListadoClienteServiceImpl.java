package com.zarcillo.service;

import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.LetraClienteDAO;
import com.zarcillo.dao.ListadoClienteDAO;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraCliente;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.dto.creditos.CronogramaCobro;
import com.zarcillo.dto.creditos.CronogramaCobroCliente;
import com.zarcillo.dto.creditos.DetalleCronogramaCobroCliente;
import com.zarcillo.dto.finanzas.CronogramaPagoProveedor;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import com.zarcillo.negocio.Dia;
import com.zarcillo.util.filtro.FiltroPorIdclienteComprobanteEmitido;
import com.zarcillo.util.filtro.FiltroPorIdclienteLetraCliente;
import com.zarcillo.util.filtro.FiltroPorIdproveedorCuentaPagar;
import com.zarcillo.util.filtro.FiltroPorIdproveedorLetraProveedor;
import com.zarcillo.util.ordenar.OrdenarPorCnomcliCliente;
import com.zarcillo.util.ordenar.OrdenarPorCnomproveedorProveedor;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("listadoClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ListadoClienteServiceImpl implements ListadoClienteService {

    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private LetraClienteDAO letraclientedao;
    @Autowired
    private ListadoClienteDAO listadoclientedao;
    @Autowired
    private DocumentoDAO documentodao;

    @Override
    @Transactional
    public List<CronogramaCobro> listaCronogramaCobro() {
        List<CronogramaCobro> listaRetorno = new ArrayList<>();

        //hace tres años
        Date diniciosaldo = Dia.sumarDias(new Date(), -1095);
        Date dfinsaldo = Dia.sumarDias(new Date(), -1);
        //tres años
        Date dhasta = Dia.sumarDias(new Date(), 1095);
        ///
        List<ComprobanteEmitido> listaComprobanteSaldo = comprobantedao.listaPendientesPorFechasPendientes(diniciosaldo, dfinsaldo);
        List<LetraCliente> listaLetraClienteSaldo = letraclientedao.listaPendientesPorFechasPendientes(diniciosaldo, dfinsaldo);

        CronogramaCobro cronogramasaldo = new CronogramaCobro();
        cronogramasaldo.setDfecha(dfinsaldo);
        cronogramasaldo.setCdia("SALDO");
        cronogramasaldo.setDetalleCronogramaCobroClienteCollection(resumenCronogramaCobroCliente(listaComprobanteSaldo, listaLetraClienteSaldo));
        cronogramasaldo.totalizar();
        listaRetorno.add(cronogramasaldo);

        List<Date> listaFechas = listadoclientedao.listaFechasCronogramaCobro(new Date(), dhasta);

        Calendar calendario = Calendar.getInstance();
        CronogramaCobro cronograma;
        List<ComprobanteEmitido> listaCOmprobante;
        List<LetraCliente> listaLetra;
        for (Date d : listaFechas) {
            listaCOmprobante = comprobantedao.listaPendientesPorFechasPendientes(d, d);
            listaLetra = letraclientedao.listaPendientesPorFechasPendientes(d, d);

            cronograma = new CronogramaCobro();
            cronograma.setDfecha(d);
            calendario.setTime(d);
            cronograma.setCdia(Dia.diaSemana((calendario.get(Calendar.DAY_OF_WEEK)) - 1));
            cronograma.setDetalleCronogramaCobroClienteCollection(resumenCronogramaCobroCliente(listaCOmprobante, listaLetra));
            cronograma.totalizar();
            listaRetorno.add(cronograma);

        }

        return listaRetorno;
    }

    @Override
    @Transactional
    public List<DetalleCronogramaCobroCliente> listaDetalleCronogramaCobro() {
        //hace tres años
        Date diniciosaldo = Dia.sumarDias(new Date(), -1095);
        //hasta tres años
        Date dhasta = Dia.sumarDias(new Date(), 1095);

        List<DetalleCronogramaCobroCliente> listaRetorno = new ArrayList<>();

        List<ComprobanteEmitido> listaComprobanteSaldo = comprobantedao.listaPendientesPorFechasPendientes(diniciosaldo, dhasta);
        List<LetraCliente> listaLetraClienteSaldo = letraclientedao.listaPendientesPorFechasPendientes(diniciosaldo, dhasta);

        List<CronogramaCobroCliente> listaCronograma = resumenCronogramaCobroCliente(listaComprobanteSaldo, listaLetraClienteSaldo);

        for (CronogramaCobroCliente c : listaCronograma) {
            listaRetorno.addAll(c.getDetalleCronogramaCobroClienteCollection());
        }

        return listaRetorno;
    }

    private List<CronogramaCobroCliente> resumenCronogramaCobroCliente(List<ComprobanteEmitido> listaComprobanteEmitido, List<LetraCliente> listaLetra) {
        Documento documentoletra = documentodao.buscarPorCcodigosunat(Documento.LETRA_SUNAT.getCcodigosunat());
        //////////////
        List<CronogramaCobroCliente> listaCronogramaCobroCliente = new ArrayList<CronogramaCobroCliente>();
        List<Cliente> listaCliente = new ArrayList<>();
        //FACTURAS
        for (ComprobanteEmitido ce : listaComprobanteEmitido) {
            if (!listaCliente.contains(ce.getIdcliente())) {
                listaCliente.add(ce.getIdcliente());
            }
        }

        //LETRAS
        for (LetraCliente lp : listaLetra) {
            if (!listaCliente.contains(lp.getIdcliente())) {
                listaCliente.add(lp.getIdcliente());
            }
        }

        Collections.sort(listaCliente, new OrdenarPorCnomcliCliente());

        List<DetalleCronogramaCobroCliente> listaDetalle;
        List<ComprobanteEmitido> listaFiltroComprobante;
        List<LetraCliente> listaFiltroLetraCliente;

        CronogramaCobroCliente cronogramacobro;
        DetalleCronogramaCobroCliente detalle;
        BigDecimal nfactura;
        BigDecimal nletra;
        for (Cliente c : listaCliente) {
            ///CRONOGRAMA
            cronogramacobro = new CronogramaCobroCliente();
            cronogramacobro.setIdcliente(c);
            ///CRONOGRAMA
            listaDetalle = new ArrayList<>();
            nfactura = new BigDecimal("0");
            nletra = new BigDecimal("0");

            listaFiltroComprobante = (List<ComprobanteEmitido>) CollectionUtils.select(listaComprobanteEmitido, new FiltroPorIdclienteComprobanteEmitido(c.getIdcliente()));
            for (ComprobanteEmitido ce : listaFiltroComprobante) {
                detalle = new DetalleCronogramaCobroCliente();
                detalle.setId(ce.getIdcomprobante());
                detalle.setIdunidad(ce.getIdunidad());
                detalle.setIdcliente(ce.getIdcliente());
                detalle.setIddocumento(ce.getIddocumento());
                detalle.setCserie(ce.getCserie());
                detalle.setCnumero(ce.getCnumero());
                detalle.setCnumgui(ce.getCnumgui());
                detalle.setDfecemi(ce.getDfecemi());
                detalle.setNplazo(ce.getNplazo());
                detalle.setDfecven(ce.getDfecven());
                detalle.setIdmoneda(ce.getIdmoneda());
                detalle.setNimporte(ce.getNimporte());
                detalle.setNacuenta(ce.getNacuenta());
                detalle.setNnotabo(ce.getNnotabo());
                detalle.setNnotcar(ce.getNnotcar());
                detalle.setNsaldo(ce.getNsaldo());
                listaDetalle.add(detalle);

                nfactura = nfactura.add(ce.getNsaldo());
            }

            listaFiltroLetraCliente = (List<LetraCliente>) CollectionUtils.select(listaLetra, new FiltroPorIdclienteLetraCliente(c.getIdcliente()));
            for (LetraCliente lc : listaFiltroLetraCliente) {
                detalle = new DetalleCronogramaCobroCliente();
                detalle.setId(lc.getIdletra());
                detalle.setIdunidad(lc.getIdunidad());
                detalle.setIdcliente(lc.getIdcliente());
                detalle.setIddocumento(documentoletra);
                detalle.setCserie("LE");
                detalle.setCnumero(lc.getCnumero());
                detalle.setDfecemi(lc.getDfecemi());
                detalle.setNplazo(lc.getNplazo());
                detalle.setDfecven(lc.getDfecven());
                detalle.setIdmoneda(lc.getIdmoneda());
                detalle.setNimporte(lc.getNimporte());
                detalle.setNacuenta(lc.getNacuenta());
                detalle.setNnotabo(lc.getNnotabo());
                detalle.setNnotcar(lc.getNnotcar());
                detalle.setNsaldo(lc.getNsaldo());
                listaDetalle.add(detalle);

                nletra = nletra.add(lc.getNsaldo());
            }

            cronogramacobro.setNfactura(nfactura);
            cronogramacobro.setNletra(nletra);
            cronogramacobro.setNtotal(nfactura.add(nletra));
            cronogramacobro.setDetalleCronogramaCobroClienteCollection(listaDetalle);
            listaCronogramaCobroCliente.add(cronogramacobro);
        }




        return listaCronogramaCobroCliente;
    }
}
