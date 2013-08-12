package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LetraClienteDAO;
import com.zarcillo.dao.NotcarClienteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraCliente;
import com.zarcillo.domain.NotcarCliente;
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
@Service("notcarClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotcarClienteServiceImpl implements NotcarClienteService{
    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotcarClienteDAO notcarclientedao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private LetraClienteDAO letraclientedao;

    @Override
    public NotcarCliente buscarPorIdnotcar(Integer idnotcar) {
        return notcarclientedao.buscarPorIdnotcar(idnotcar);
    }

    @Override
    @Transactional
    public NotcarCliente registrar(NotcarCliente notcar) {
        try {
            notcar.setNsaldo(notcar.getNimporte());
            notcar.setIdperiodo(periododao.buscarPorFecha(notcar.getDfecemi()));
            notcar.setDfecreg(new Date());
            cruddao.registrar(notcar);

            return notcarclientedao.buscarPorIdnotcar(notcar.getIdnotcar());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public NotcarCliente actualizar(NotcarCliente notcar) {
        try {
            cruddao.actualizar(notcar);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return notcar;
    }

    @Override
    @Transactional
    public void eliminar(NotcarCliente nt) {
        NotcarCliente notcar;
        try {
            notcar = notcarclientedao.buscarPorIdnotcar(nt.getIdnotcar());

            if (notcar.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!Numero.isIgual(notcar.getNimporte(), notcar.getNsaldo())) {
                throw new ExceptionZarcillo("la NC tiene amortizaciones imposible eliminar");
            }

            cruddao.eliminar(notcar);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    @Transactional
    public NotcarCliente amortizar(AmortizacionCliente amortizacion) {
        NotcarCliente notcar = new NotcarCliente();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarnotcar = amortizacion.getNimporte();
        try {
            notcar = notcarclientedao.buscarPorIdnotcar(amortizacion.getIdnotcar().getIdnotcar());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdnotcar(notcar);

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraCliente letracliente = letraclientedao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
                amortizacion.setIdletra(letracliente);

                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (letracliente.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimporteamortizar = amortizacion.getNimporte();
                    amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
                } else {
                    //SI LETRA ES SOLES
                    if (letracliente.getIdmoneda().getBnacional()) {
                        //SI LETRA ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                            nimporteamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI LETRA ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                            amortizacion.setIdmoneda(letracliente.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letracliente.setNnotcar(letracliente.getNnotcar().add(nimporteamortizar));
                letracliente.setNsaldo(letracliente.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(letracliente.getNsaldo())) {
                    letracliente.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(letracliente);

            } else {
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
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                            amortizacion.setIdmoneda(comprobante.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI COMPROBANTE ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                comprobante.setNnotcar(comprobante.getNnotcar().add(nimporteamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.registrar(amortizacion);


            notcar.setNacuenta(notcar.getNacuenta().add(nimporteamortizarnotcar));
            notcar.setNsaldo(notcar.getNsaldo().subtract(nimporteamortizarnotcar));
            if (Numero.isCero(notcar.getNsaldo())) {
                notcar.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(notcar);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return notcarclientedao.buscarPorIdnotcar(notcar.getIdnotcar());
    }

    @Override
    @Transactional
    public NotcarCliente desamortizar(AmortizacionCliente amortizacion) {
        NotcarCliente notcar = new NotcarCliente();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarnotcar = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            notcar = notcarclientedao.buscarPorIdnotcar(amortizacion.getIdnotcar().getIdnotcar());

            //SI EL DEPOSITO ES EN SOLES
            if (notcar.getIdmoneda().getBnacional()) {
                nimportedesamortizarnotcar = amortizacion.getNimportes();
            }
            //                       

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraCliente letracliente = letraclientedao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (letracliente.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimportedesamortizar = amortizacion.getNimporte();
                } else {
                    //SI LETRA ES SOLES
                    if (letracliente.getIdmoneda().getBnacional()) {
                        //SI LETRA ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            nimportedesamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI LETRA ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letracliente.setNnotcar(letracliente.getNnotcar().subtract(nimportedesamortizar));
                letracliente.setNsaldo(letracliente.getNsaldo().add(nimportedesamortizar));
                letracliente.setDfeccan(null);
                if (Numero.isCero(letracliente.getNsaldo())) {
                    letracliente.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(letracliente);

            } else {
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                        }
                    }//FIN SI COMPROBANTE ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                comprobante.setNnotcar(comprobante.getNnotcar().subtract(nimportedesamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().add(nimportedesamortizar));
                comprobante.setDfeccan(null);
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.eliminar(amortizacion);


            notcar.setNacuenta(notcar.getNacuenta().subtract(nimportedesamortizarnotcar));
            notcar.setNsaldo(notcar.getNsaldo().add(nimportedesamortizarnotcar));
            notcar.setDfeccan(null);
            if (Numero.isCero(notcar.getNsaldo())) {
                notcar.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(notcar);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return notcarclientedao.buscarPorIdnotcar(notcar.getIdnotcar());
    }

    @Override
    public List<AmortizacionCliente> listaAmortizaciones(Integer idnotcar) {
        return amortizaciondao.listaPorIdnotcar(idnotcar);
    }

    @Override
    public List<NotcarCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return notcarclientedao.listaPorIdunidadPorIdclientePorNano(idunidad, idcliente, nano);
    }
}
