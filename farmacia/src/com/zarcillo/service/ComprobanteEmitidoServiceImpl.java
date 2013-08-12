package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("comprobanteEmitidoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ComprobanteEmitidoServiceImpl implements ComprobanteEmitidoService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    DecimalFormat formato = new DecimalFormat("000000");

    @Override
    public ComprobanteEmitido buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunidad, Integer iddocumento, String cserie, String cnumero) {
        try {
            String cformato = formato.format(Integer.parseInt(cnumero));

            return comprobantedao.buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(idunidad, iddocumento, cserie, cformato);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe El documento con " + cserie + "-" + cnumero);
        }
    }

    @Override
    public ComprobanteEmitido buscarPorIdregsalida(Integer idregsalida) {
        try {
            return comprobantedao.buscarPorIdregsalida(idregsalida);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No Existe un documento con la operacion:" + idregsalida);
        }
    }

    @Override
    public ComprobanteEmitido buscarPorIdcomprobante(Integer idcomprobante) {
        return comprobantedao.buscarPorIdcomprobante(idcomprobante);
    }

    @Override
    @Transactional
    public ComprobanteEmitido amortizar(AmortizacionCliente amortizacion) {
        ComprobanteEmitido comprobante = new ComprobanteEmitido();
        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        try {
            comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdcomprobante(comprobante);

            //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (comprobante.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimporteamortizar = amortizacion.getNimporte();
                amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
            } else {
                //SI CUENTAS PAGAR ES SOLES
                if (comprobante.getIdmoneda().getBnacional()) {
                    //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                        nimporteamortizar = amortizacion.getNimportes();
                    }
                } else {
                    //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                        amortizacion.setIdmoneda(comprobante.getIdmoneda());
                        amortizacion.setNimportes(amortizacion.getNimporte());
                        amortizacion.setNimporte(nimporteamortizar);
                    }
                }//FIN SI CUENTAS PAGAR ES SOLES
            }//FIN SI MONEDAS SONIGUALES

            cruddao.registrar(amortizacion);

            comprobante.setNacuenta(comprobante.getNacuenta().add(nimporteamortizar));
            comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
            if (Numero.isCero(comprobante.getNsaldo())) {
                comprobante.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(comprobante);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return comprobantedao.buscarPorIdcomprobante(comprobante.getIdcomprobante());
    }

    @Override
    @Transactional
    public ComprobanteEmitido desamortizar(AmortizacionCliente amortizacion) {
        ComprobanteEmitido comprobante = new ComprobanteEmitido();
        BigDecimal nimportedesamortizar = amortizacion.getNimporte();

        try {

            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());

            if (!amortizacion.getIdtipo().getBpago()) {
                throw new ExceptionZarcillo("Elimine la Amortizacion desde la pestaña " + amortizacion.getIdtipo());
            }
            //


            //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (comprobante.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimportedesamortizar = amortizacion.getNimporte();
            } else {
                //SI CUENTAS PAGAR ES SOLES
                if (comprobante.getIdmoneda().getBnacional()) {
                    //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimportes();
                    }
                } else {
                    //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                    }
                }//FIN SI CUENTAS PAGAR ES SOLES
            }//FIN SI MONEDAS SONIGUALES

            cruddao.eliminar(amortizacion);

            comprobante.setNacuenta(comprobante.getNacuenta().subtract(nimportedesamortizar));
            comprobante.setNsaldo(comprobante.getNsaldo().add(nimportedesamortizar));
            comprobante.setDfeccan(null);

            if (Numero.isCero(comprobante.getNsaldo())) {
                comprobante.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(comprobante);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
        return comprobantedao.buscarPorIdcomprobante(comprobante.getIdcomprobante());
    }

    @Override
    public List<AmortizacionCliente> listaAmortizaciones(Integer idcomprobante) {
        return amortizaciondao.listaPorIdcomprobante(idcomprobante);
    }

    @Override
    public List<ComprobanteEmitido> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return comprobantedao.listaPorIdunidadPorIdclientePorNano(idunidad, idcliente, nano);
    }
}
