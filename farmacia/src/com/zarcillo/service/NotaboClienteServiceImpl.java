package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LetraClienteDAO;
import com.zarcillo.dao.NotaboClienteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraCliente;
import com.zarcillo.domain.NotaboCliente;
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
@Service("notaboClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotaboClienteServiceImpl implements NotaboClienteService{
    
    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotaboClienteDAO notaboclientedao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private LetraClienteDAO letraclientedao;

    @Override
    public NotaboCliente buscarPorIdnotabo(Integer idnotabo) {
        return notaboclientedao.buscarPorIdnotabo(idnotabo);
    }

    @Override
    @Transactional
    public NotaboCliente registrar(NotaboCliente notabo) {
        try {
            notabo.setNsaldo(notabo.getNimporte());
            notabo.setIdperiodo(periododao.buscarPorFecha(notabo.getDfecemi()));
            notabo.setDfecreg(new Date());
            cruddao.registrar(notabo);

            return notaboclientedao.buscarPorIdnotabo(notabo.getIdnotabo());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public NotaboCliente actualizar(NotaboCliente notabo) {
        try {
            cruddao.actualizar(notabo);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return notabo;
    }

    @Override
    @Transactional
    public void eliminar(NotaboCliente nt) {
          NotaboCliente notabo;
        try {
            notabo = notaboclientedao.buscarPorIdnotabo(nt.getIdnotabo());

            if (notabo.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!Numero.isIgual(notabo.getNimporte(), notabo.getNsaldo())) {
                throw new ExceptionZarcillo("la NC tiene amortizaciones imposible eliminar");
            }

            cruddao.eliminar(notabo);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    @Transactional
    public NotaboCliente amortizar(AmortizacionCliente amortizacion) {
        NotaboCliente notabo = new NotaboCliente();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarnotabo = amortizacion.getNimporte();
        try {
            notabo = notaboclientedao.buscarPorIdnotabo(amortizacion.getIdnotabo().getIdnotabo());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdnotabo(notabo);

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
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                            amortizacion.setIdmoneda(letracliente.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letracliente.setNnotabo(letracliente.getNnotabo().add(nimporteamortizar));
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
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                            amortizacion.setIdmoneda(comprobante.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI COMPROBANTE ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                comprobante.setNnotabo(comprobante.getNnotabo().add(nimporteamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.registrar(amortizacion);


            notabo.setNacuenta(notabo.getNacuenta().add(nimporteamortizarnotabo));
            notabo.setNsaldo(notabo.getNsaldo().subtract(nimporteamortizarnotabo));
            if (Numero.isCero(notabo.getNsaldo())) {
                notabo.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(notabo);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return notaboclientedao.buscarPorIdnotabo(notabo.getIdnotabo());
    }

    @Override
    @Transactional
    public NotaboCliente desamortizar(AmortizacionCliente amortizacion) {
        NotaboCliente notabo = new NotaboCliente();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarnotabo = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            notabo = notaboclientedao.buscarPorIdnotabo(amortizacion.getIdnotabo().getIdnotabo());

            //SI EL DEPOSITO ES EN SOLES
            if (notabo.getIdmoneda().getBnacional()) {
                nimportedesamortizarnotabo = amortizacion.getNimportes();
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letracliente.setNnotabo(letracliente.getNnotabo().subtract(nimportedesamortizar));
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        }
                    }//FIN SI COMPROBANTE ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                comprobante.setNnotabo(comprobante.getNnotabo().subtract(nimportedesamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().add(nimportedesamortizar));
                comprobante.setDfeccan(null);
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.eliminar(amortizacion);


            notabo.setNacuenta(notabo.getNacuenta().subtract(nimportedesamortizarnotabo));
            notabo.setNsaldo(notabo.getNsaldo().add(nimportedesamortizarnotabo));
            notabo.setDfeccan(null);
            if (Numero.isCero(notabo.getNsaldo())) {
                notabo.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(notabo);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return notaboclientedao.buscarPorIdnotabo(notabo.getIdnotabo());
    }

    @Override
    public List<AmortizacionCliente> listaAmortizaciones(Integer idnotabo) {
        return amortizaciondao.listaPorIdnotabo(idnotabo);
    }

    @Override
    public List<NotaboCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return notaboclientedao.listaPorIdunidadPorIdclientePorNano(idunidad, idcliente, nano);
    }

   
    
}
