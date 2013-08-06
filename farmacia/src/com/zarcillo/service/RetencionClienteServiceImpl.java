package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LetraClienteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.RetencionClienteDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraCliente;
import com.zarcillo.domain.RetencionCliente;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
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
@Service("retencionClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RetencionClienteServiceImpl implements RetencionClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private RetencionClienteDAO retenciondao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;

    @Override
    public RetencionCliente buscarPorIdretencion(Integer idretencion) {
        return retenciondao.buscarPorIdretencion(idretencion);
    }

    @Override
    @Transactional
    public RetencionCliente registrar(RetencionCliente retencion) {
        try {
            retencion.setNsaldo(retencion.getNimporte());
            retencion.setIdperiodo(periododao.buscarPorFecha(retencion.getDfecemi()));
            retencion.setDfecreg(new Date());
            cruddao.registrar(retencion);

            return retenciondao.buscarPorIdretencion(retencion.getIdretencion());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public RetencionCliente actualizar(RetencionCliente retencion) {
        try {
            cruddao.actualizar(retencion);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return retencion;
    }

    @Override
    @Transactional
    public void eliminar(RetencionCliente nt) {
        RetencionCliente retencion;
        try {
            retencion = retenciondao.buscarPorIdretencion(nt.getIdretencion());

            if (retencion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!Numero.isIgual(retencion.getNimporte(), retencion.getNsaldo())) {
                throw new ExceptionZarcillo("la NC tiene amortizaciones imposible eliminar");
            }

            cruddao.eliminar(retencion);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    @Transactional
    public RetencionCliente amortizar(AmortizacionCliente amortizacion) {
        RetencionCliente retencion = new RetencionCliente();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarretencion = amortizacion.getNimporte();
        try {
            retencion = retenciondao.buscarPorIdretencion(amortizacion.getIdretencion().getIdretencion());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdretencion(retencion);


            //COMPROBANTE Y AMORTIZAZION TIENEN IGUAL MONEDA
            ComprobanteEmitido comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());
            amortizacion.setIdcomprobante(comprobante);

            //COMPROBANTE Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (comprobante.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimporteamortizar = amortizacion.getNimporte();
                amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
            } else {
                //SI COMPROBANTE ES SOLES
                if (comprobante.getIdmoneda().getBnacional()) {
                    //SI COMPROBANTE ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                        nimporteamortizar = amortizacion.getNimportes();
                    }
                } else {
                    //SI COMPROBANTE ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        amortizacion.setIdmoneda(comprobante.getIdmoneda());
                        amortizacion.setNimportes(amortizacion.getNimporte());
                        amortizacion.setNimporte(nimporteamortizar);
                    }
                }//FIN SI COMPROBANTE ES SOLES
            }//FIN SI MONEDAS SONIGUALES
            comprobante.setNretencion(comprobante.getNretencion().add(nimporteamortizar));
            comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
            if (Numero.isCero(comprobante.getNsaldo())) {
                comprobante.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(comprobante);



            cruddao.registrar(amortizacion);


            retencion.setNacuenta(retencion.getNacuenta().add(nimporteamortizarretencion));
            retencion.setNsaldo(retencion.getNsaldo().subtract(nimporteamortizarretencion));
            if (Numero.isCero(retencion.getNsaldo())) {
                retencion.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(retencion);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return retenciondao.buscarPorIdretencion(retencion.getIdretencion());
    }

    @Override
    @Transactional
    public RetencionCliente desamortizar(AmortizacionCliente amortizacion) {
        RetencionCliente retencion = new RetencionCliente();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarretencion = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            retencion = retenciondao.buscarPorIdretencion(amortizacion.getIdretencion().getIdretencion());

            //SI EL DEPOSITO ES EN SOLES
            if (retencion.getIdmoneda().getBnacional()) {
                nimportedesamortizarretencion = amortizacion.getNimportes();
            }
            //                       


            //COMPROBANTE Y AMORTIZAZION TIENEN IGUAL MONEDA
            ComprobanteEmitido comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());
            //COMPROBANTE Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (comprobante.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimportedesamortizar = amortizacion.getNimporte();
            } else {
                //SI COMPROBANTE ES SOLES
                if (comprobante.getIdmoneda().getBnacional()) {
                    //SI COMPROBANTE ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimportes();
                    }
                } else {
                    //SI COMPROBANTE ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                    }
                }//FIN SI COMPROBANTE ES SOLES
            }//FIN SI MONEDAS SONIGUALES
            comprobante.setNretencion(comprobante.getNretencion().subtract(nimportedesamortizar));
            comprobante.setNsaldo(comprobante.getNsaldo().add(nimportedesamortizar));
            comprobante.setDfeccan(null);
            if (Numero.isCero(comprobante.getNsaldo())) {
                comprobante.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(comprobante);



            cruddao.eliminar(amortizacion);


            retencion.setNacuenta(retencion.getNacuenta().subtract(nimportedesamortizarretencion));
            retencion.setNsaldo(retencion.getNsaldo().add(nimportedesamortizarretencion));
            retencion.setDfeccan(null);
            if (Numero.isCero(retencion.getNsaldo())) {
                retencion.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(retencion);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return retenciondao.buscarPorIdretencion(retencion.getIdretencion());
    }

    @Override
    public List<AmortizacionCliente> listaAmortizaciones(Integer idretencion) {
        return amortizaciondao.listaPorIdretencion(idretencion);
    }

    @Override
    public List<RetencionCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return retenciondao.listaPorIdunidadPorIdclientePorNano(idunidad, idcliente, nano);
    }

    @Override
    public List<RetencionCliente> listaPorIdunidadPorIdperiodo(Integer idunidad, Integer idperiodo) {
        return retenciondao.listaPorIdunidadPorIdperiodo(idunidad, idperiodo);
    }
}
