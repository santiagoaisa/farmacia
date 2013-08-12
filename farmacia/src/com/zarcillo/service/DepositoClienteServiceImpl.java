package com.zarcillo.service;

import com.zarcillo.dao.LetraClienteDAO;
import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DepositoClienteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.DepositoCliente;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraCliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogDepositoCliente;
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
@Service("depositoClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DepositoClienteServiceImpl implements DepositoClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private DepositoClienteDAO depositodao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private LetraClienteDAO letradao;

    @Override
    @Transactional
    public DepositoCliente registrar(DepositoCliente deposito) {
        try {
            deposito.setDfecreg(new Date());
            cruddao.registrar(deposito);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), deposito);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Deposito");
        }
        return deposito;
    }

    @Override
    @Transactional
    public DepositoCliente actualizar(DepositoCliente deposito) {
        try {
            cruddao.actualizar(deposito);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), deposito);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Deposito");
        }
        return deposito;
    }

    @Override
    @Transactional
    public void eliminar(DepositoCliente dp) {
        DepositoCliente deposito;
        try {
            deposito = depositodao.buscarPorIddeposito(dp.getIddeposito());

            if (deposito.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!Numero.isIgual(deposito.getNimporte(), deposito.getNsaldo())) {
                throw new ExceptionZarcillo("El Deposito tiene amortizaciones imposible eliminar");
            }

            cruddao.eliminar(deposito);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    @Transactional
    public DepositoCliente amortizar(AmortizacionCliente amortizacion) {
        DepositoCliente deposito = new DepositoCliente();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizardeposito = amortizacion.getNimporte();
        try {
            deposito = depositodao.buscarPorIddeposito(amortizacion.getIddeposito().getIddeposito());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIddeposito(deposito);

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraCliente letracliente = letradao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
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
                letracliente.setNacuenta(letracliente.getNacuenta().add(nimporteamortizar));
                letracliente.setNsaldo(letracliente.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(letracliente.getNsaldo())) {
                    letracliente.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(letracliente);

            } else {
                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                ComprobanteEmitido comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());
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
                comprobante.setNacuenta(comprobante.getNacuenta().add(nimporteamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.registrar(amortizacion);


            deposito.setNacuenta(deposito.getNacuenta().add(nimporteamortizardeposito));
            deposito.setNsaldo(deposito.getNsaldo().subtract(nimporteamortizardeposito));
            if (Numero.isCero(deposito.getNsaldo())) {
                deposito.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(deposito);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return depositodao.buscarPorIddeposito(deposito.getIddeposito());
    }

    @Override
    @Transactional
    public DepositoCliente desamortizar(AmortizacionCliente amortizacion) {
        DepositoCliente deposito = new DepositoCliente();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizardeposito = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            deposito = depositodao.buscarPorIddeposito(amortizacion.getIddeposito().getIddeposito());

            //SI EL DEPOSITO ES EN SOLES
            if (deposito.getIdmoneda().getBnacional()) {
                nimportedesamortizardeposito = amortizacion.getNimportes();
            }
            //                       

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraCliente letraproveedor = letradao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (letraproveedor.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimportedesamortizar = amortizacion.getNimporte();
                } else {
                    //SI LETRA ES SOLES
                    if (letraproveedor.getIdmoneda().getBnacional()) {
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
                letraproveedor.setNacuenta(letraproveedor.getNacuenta().subtract(nimportedesamortizar));
                letraproveedor.setNsaldo(letraproveedor.getNsaldo().add(nimportedesamortizar));
                letraproveedor.setDfeccan(null);
                if (Numero.isCero(letraproveedor.getNsaldo())) {
                    letraproveedor.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(letraproveedor);

            } else {
                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                ComprobanteEmitido comprobante = comprobantedao.buscarPorIdcomprobante(amortizacion.getIdcomprobante().getIdcomprobante());
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
                comprobante.setNacuenta(comprobante.getNacuenta().subtract(nimportedesamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().add(nimportedesamortizar));
                comprobante.setDfeccan(null);
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);

            }

            cruddao.eliminar(amortizacion);


            deposito.setNacuenta(deposito.getNacuenta().subtract(nimportedesamortizardeposito));
            deposito.setNsaldo(deposito.getNsaldo().add(nimportedesamortizardeposito));
            deposito.setDfeccan(null);
            if (Numero.isCero(deposito.getNsaldo())) {
                deposito.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(deposito);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return depositodao.buscarPorIddeposito(deposito.getIddeposito());
    }

    @Override
    @Transactional
    public List<AmortizacionCliente> listaAmortizaciones(Integer iddeposito) {
        return amortizaciondao.listaPorIddeposito(iddeposito);
    }

    @Override
    public DepositoCliente buscarPorIddeposito(Integer iddeposito) {
        try {
            return depositodao.buscarPorIddeposito(iddeposito);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un deposito con id:" + iddeposito);
        }
    }

    @Override
    public List<DepositoCliente> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return depositodao.listaPorIdunidadPorIdclientePorNano(idunidad, idcliente, nano);
    }

    private void registrarLog(String cmotivo, DepositoCliente deposito) {
        LogDepositoCliente logdeposito = new LogDepositoCliente();
        logdeposito.setCmotivo(cmotivo);
        logdeposito.setCobservacion(LogZarcillo.log(deposito));
        logdeposito.setIddeposito(deposito);
        logdeposito.setIdusuario(deposito.getIdusuario());
        logdeposito.setDfecreg(new Date());
        cruddao.registrar(logdeposito);
    }
}
