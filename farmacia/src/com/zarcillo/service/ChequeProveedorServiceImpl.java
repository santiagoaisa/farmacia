package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.ChequeProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.LetraProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.ChequeProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogChequeProveedor;
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
@Service("chequeProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChequeProveedorServiceImpl implements ChequeProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ChequeProveedorDAO chequeproveedordao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;
    @Autowired
    private LetraProveedorDAO letraproveedordao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;

    @Override
    @Transactional
    public ChequeProveedor registrar(ChequeProveedor cheque) {
        try {
            cheque.setDfecreg(new Date());
            cheque.setIdperiodo(periododao.buscarPorFecha(cheque.getDfecha()));
            cruddao.registrar(cheque);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), cheque);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Cheque");
        }
        return cheque;
    }

    @Override
    @Transactional
    public ChequeProveedor actualizar(ChequeProveedor cheque) {
        try {
            cruddao.actualizar(cheque);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), cheque);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Cheque");
        }
        return cheque;
    }

    @Override
    @Transactional
    public void eliminar(ChequeProveedor cheque) {
        try {
            cruddao.eliminar(cheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Cheque");
        }
    }

    @Override
    @Transactional
    public ChequeProveedor amortizar(AmortizacionProveedor amortizacion) {
        ChequeProveedor cheque = new ChequeProveedor();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarcheque = amortizacion.getNimporte();
        try {
            cheque = chequeproveedordao.buscarPorIdcheque(amortizacion.getIdcheque().getIdcheque());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdcheque(cheque);

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraProveedor letraproveedor = letraproveedordao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
                amortizacion.setIdletra(letraproveedor);

                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (letraproveedor.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimporteamortizar = amortizacion.getNimporte();
                    amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
                } else {
                    //SI LETRA ES SOLES
                    if (letraproveedor.getIdmoneda().getBnacional()) {
                        //SI LETRA ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                            nimporteamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI LETRA ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                            amortizacion.setIdmoneda(letraproveedor.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letraproveedor.setNacuenta(letraproveedor.getNacuenta().add(nimporteamortizar));
                letraproveedor.setNsaldo(letraproveedor.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(letraproveedor.getNsaldo())) {
                    letraproveedor.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(letraproveedor);

            } else {
                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                CuentaPagar cuentapagar = cuentapagardao.buscarPorIdcuenta(amortizacion.getIdcuenta().getIdcuenta());
                amortizacion.setIdcuenta(cuentapagar);

                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (cuentapagar.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimporteamortizar = amortizacion.getNimporte();
                    amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
                } else {
                    //SI CUENTAS PAGAR ES SOLES
                    if (cuentapagar.getIdmoneda().getBnacional()) {
                        //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                            nimporteamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                            amortizacion.setIdmoneda(cuentapagar.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI CUENTAS PAGAR ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                cuentapagar.setNacuenta(cuentapagar.getNacuenta().add(nimporteamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

            }

            cruddao.registrar(amortizacion);


            cheque.setNacuenta(cheque.getNacuenta().add(nimporteamortizarcheque));
            cheque.setNsaldo(cheque.getNsaldo().subtract(nimporteamortizarcheque));
            if (Numero.isCero(cheque.getNsaldo())) {
                cheque.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(cheque);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return chequeproveedordao.buscarPorIdcheque(cheque.getIdcheque());
    }

    @Override
    @Transactional
    public ChequeProveedor desamortizar(AmortizacionProveedor amortizacion) {
        ChequeProveedor cheque = new ChequeProveedor();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarcheque = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            cheque = chequeproveedordao.buscarPorIdcheque(amortizacion.getIdcheque().getIdcheque());

            //SI EL DEPOSITO ES EN SOLES
            if (cheque.getIdmoneda().getBnacional()) {
                nimportedesamortizarcheque = amortizacion.getNimportes();
            }
            //                       

            if (amortizacion.getIddocumento().getCcodigosunat().contains(Documento.LETRA_SUNAT.getCcodigosunat())) {
                //LETRA Y AMORTIZAZION TIENEN IGUAL MONEDA
                LetraProveedor letraproveedor = letraproveedordao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
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
                CuentaPagar cuentapagar = cuentapagardao.buscarPorIdcuenta(amortizacion.getIdcuenta().getIdcuenta());
                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (cuentapagar.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimportedesamortizar = amortizacion.getNimporte();
                } else {
                    //SI CUENTAS PAGAR ES SOLES
                    if (cuentapagar.getIdmoneda().getBnacional()) {
                        //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            nimportedesamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        }
                    }//FIN SI CUENTAS PAGAR ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                cuentapagar.setNacuenta(cuentapagar.getNacuenta().subtract(nimportedesamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(nimportedesamortizar));
                cuentapagar.setDfeccan(null);
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

            }

            cruddao.eliminar(amortizacion);


            cheque.setNacuenta(cheque.getNacuenta().subtract(nimportedesamortizarcheque));
            cheque.setNsaldo(cheque.getNsaldo().add(nimportedesamortizarcheque));
            cheque.setDfeccan(null);
            if (Numero.isCero(cheque.getNsaldo())) {
                cheque.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(cheque);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return chequeproveedordao.buscarPorIdcheque(cheque.getIdcheque());
    }

    @Override
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idcheque) {
        return amortizaciondao.listaPorIdcheque(idcheque);
    }

    @Override
    public ChequeProveedor buscar(Integer idcheque) {
        try {
            return chequeproveedordao.buscarPorIdcheque(idcheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un cheque con id:" + idcheque);
        }
    }

    @Override
   
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return chequeproveedordao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<ChequeProveedor> listaRetorno = chequeproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(chequeproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }

    private void registrarLog(String cmotivo, ChequeProveedor cheque) {
        LogChequeProveedor logcheque = new LogChequeProveedor();
        logcheque.setCmotivo(cmotivo);
        logcheque.setCobservacion(LogZarcillo.log(cheque));
        logcheque.setIdcheque(cheque);
        logcheque.setIdusuario(cheque.getIdusuario());
        logcheque.setDfecreg(new Date());
        cruddao.registrar(logcheque);
    }
}
