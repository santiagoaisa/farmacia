package com.zarcillo.service;

import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.LetraProveedorDAO;
import com.zarcillo.dao.ListadoProveedorDAO;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.dto.finanzas.CronogramaPago;
import com.zarcillo.dto.finanzas.CronogramaPagoProveedor;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import com.zarcillo.negocio.Dia;
import com.zarcillo.util.filtro.FiltroPorIdproveedorCuentaPagar;
import com.zarcillo.util.filtro.FiltroPorIdproveedorLetraProveedor;
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
@Service("listadoProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ListadoProveedorServiceImpl implements ListadoProveedorService {

    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private LetraProveedorDAO letraproveedordao;
    @Autowired
    private ListadoProveedorDAO listadoproveedordao;
    @Autowired
    private DocumentoDAO documentodao;

    @Override
    @Transactional
    public List<CronogramaPago> listaCronogramaPago(Date dhasta) {
        List<CronogramaPago> listaRetorno = new ArrayList<>();

        //hace tres años
        Date diniciosaldo = Dia.sumarDias(new Date(), -1095);
        Date dfinsaldo = Dia.sumarDias(new Date(), -1);

        List<CuentaPagar> listaCuentaPagarSaldo = cuentapagardao.listaPendientesPorFechasPendientes(diniciosaldo, dfinsaldo);
        List<LetraProveedor> listaLetraProveedorSaldo = letraproveedordao.listaPendientesPorFechasPendientes(diniciosaldo, dfinsaldo);

        CronogramaPago cronogramasaldo = new CronogramaPago();
        cronogramasaldo.setDfecha(dhasta);
        cronogramasaldo.setCdia("SALDO");
        cronogramasaldo.setDetalleCronogramaPagoProveedorCollection(resumenCronogramaPagoProveedor(listaCuentaPagarSaldo, listaLetraProveedorSaldo));
        cronogramasaldo.totalizar();
        listaRetorno.add(cronogramasaldo);

        List<Date> listaFechas = listadoproveedordao.listaFechasCronogramaPago(new Date(), dhasta);

        Calendar calendario = Calendar.getInstance();
        CronogramaPago cronograma;
        List<CuentaPagar> listaCuentaPagar;
        List<LetraProveedor> listaLetra;
        for (Date d : listaFechas) {
            listaCuentaPagar = cuentapagardao.listaPendientesPorFechasPendientes(d, d);
            listaLetra = letraproveedordao.listaPendientesPorFechasPendientes(d, d);

            cronograma = new CronogramaPago();
            cronograma.setDfecha(d);
            calendario.setTime(d);
            cronograma.setCdia(Dia.diaSemana((calendario.get(Calendar.DAY_OF_WEEK)) - 1));
            cronograma.setDetalleCronogramaPagoProveedorCollection(resumenCronogramaPagoProveedor(listaCuentaPagar, listaLetraProveedorSaldo));
            cronograma.totalizar();
            listaRetorno.add(cronograma);

        }

        return listaRetorno;
    }

    private List<CronogramaPagoProveedor> resumenCronogramaPagoProveedor(List<CuentaPagar> listaCuentaPagar, List<LetraProveedor> listaLetra) {
        Documento documentoletra = documentodao.buscarPorCcodigosunat(Documento.LETRA_SUNAT.getCcodigosunat());
        //////////////
        List<CronogramaPagoProveedor> listaCronogramaPagoProveedor = new ArrayList<CronogramaPagoProveedor>();
        List<Proveedor> listaProveedor = new ArrayList<>();
        //FACTURAS
        for (CuentaPagar cp : listaCuentaPagar) {
            if (!listaProveedor.contains(cp.getIdproveedor())) {
                listaProveedor.add(cp.getIdproveedor());
            }
        }

        //LETRAS
        for (LetraProveedor lp : listaLetra) {
            if (!listaProveedor.contains(lp.getIdproveedor())) {
                listaProveedor.add(lp.getIdproveedor());
            }
        }

        Collections.sort(listaProveedor, new OrdenarPorCnomproveedorProveedor());

        List<DetalleCronogramaPagoProveedor> listaDetalle;
        List<CuentaPagar> listaFiltroCuentasPagar;
        List<LetraProveedor> listaFiltroLetraProveedor;

        CronogramaPagoProveedor cronogramapago;
        DetalleCronogramaPagoProveedor detalle;
        BigDecimal nfactura;
        BigDecimal nletra;
        for (Proveedor p : listaProveedor) {
            ///CRONOGRAMA
            cronogramapago = new CronogramaPagoProveedor();
            cronogramapago.setIdproveedor(p);
            ///CRONOGRAMA
            listaDetalle = new ArrayList<>();
            nfactura = new BigDecimal("0");
            nletra = new BigDecimal("0");

            listaFiltroCuentasPagar = (List<CuentaPagar>) CollectionUtils.select(listaCuentaPagar, new FiltroPorIdproveedorCuentaPagar(p.getIdproveedor()));
            for (CuentaPagar cp : listaFiltroCuentasPagar) {
                detalle = new DetalleCronogramaPagoProveedor();
                detalle.setId(cp.getIdcuenta());
                detalle.setIdunidad(cp.getIdunidad());
                detalle.setIdproveedor(cp.getIdproveedor());
                detalle.setIddocumento(cp.getIddocumento());
                detalle.setCserie(cp.getCserie());
                detalle.setCnumero(cp.getCnumero());
                detalle.setCnumgui(cp.getCnumgui());
                detalle.setDfecemi(cp.getDfecemi());
                detalle.setNplazo(cp.getNplazo());
                detalle.setDfecven(cp.getDfecven());
                detalle.setIdmoneda(cp.getIdmoneda());
                detalle.setNimporte(cp.getNimporte());
                detalle.setNacuenta(cp.getNacuenta());
                detalle.setNnotabo(cp.getNnotabo());
                detalle.setNnotcar(cp.getNnotcar());
                detalle.setNsaldo(cp.getNsaldo());
                listaDetalle.add(detalle);

                nfactura = nfactura.add(cp.getNsaldo());
            }

            listaFiltroLetraProveedor = (List<LetraProveedor>) CollectionUtils.select(listaLetra, new FiltroPorIdproveedorLetraProveedor(p.getIdproveedor()));
            for (LetraProveedor lp : listaFiltroLetraProveedor) {
                detalle = new DetalleCronogramaPagoProveedor();
                detalle.setId(lp.getIdletra());
                detalle.setIdunidad(lp.getIdunidad());
                detalle.setIdproveedor(lp.getIdproveedor());
                detalle.setIddocumento(documentoletra);
                detalle.setCserie("LE");
                detalle.setCnumero(lp.getCnumero());
                detalle.setDfecemi(lp.getDfecemi());
                detalle.setNplazo(lp.getNplazo());
                detalle.setDfecven(lp.getDfecven());
                detalle.setIdmoneda(lp.getIdmoneda());
                detalle.setNimporte(lp.getNimporte());
                detalle.setNacuenta(lp.getNacuenta());
                detalle.setNnotabo(lp.getNnotabo());
                detalle.setNnotcar(lp.getNnotcar());
                detalle.setNsaldo(lp.getNsaldo());
                listaDetalle.add(detalle);

                nletra = nletra.add(lp.getNsaldo());
            }

            cronogramapago.setNfactura(nfactura);
            cronogramapago.setNletra(nletra);
            cronogramapago.setNtotal(nfactura.add(nletra));
            cronogramapago.setDetalleCronogramaPagoProveedorCollection(listaDetalle);
            listaCronogramaPagoProveedor.add(cronogramapago);
        }




        return listaCronogramaPagoProveedor;
    }
}
