package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.DepositoProveedorDAO;
import com.zarcillo.dao.LetraProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.DepositoProveedor;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraProveedor;
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
@Service("depositoProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DepositoProveedorServiceImpl implements DepositoProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private DepositoProveedorDAO depositodao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private LetraProveedorDAO letradao;

    @Override
    @Transactional
    public DepositoProveedor registrar(DepositoProveedor deposito) {
        try {
            deposito.setNsaldo(deposito.getNimporte());
            deposito.setIdperiodo(periododao.buscarPorFecha(deposito.getDfecha()));
            deposito.setDfecreg(new Date());
            cruddao.registrar(deposito);

            return depositodao.buscarPorIddeposito(deposito.getIddeposito());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public DepositoProveedor actualizar(DepositoProveedor deposito) {
        try {
            cruddao.actualizar(deposito);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return deposito;
    }

    @Override
    @Transactional
    public void eliminar(DepositoProveedor dp) {
        DepositoProveedor deposito;
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
    public DepositoProveedor buscarPorIddeposito(Integer iddeposito) {
        return depositodao.buscarPorIddeposito(iddeposito);
    }

    @Override
    @Transactional
    public DepositoProveedor amortizar(AmortizacionProveedor amortizacion) {
        DepositoProveedor deposito = new DepositoProveedor();

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
                LetraProveedor letraproveedor = letradao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
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
    public DepositoProveedor desamortizar(AmortizacionProveedor amortizacion) {
        DepositoProveedor deposito = new DepositoProveedor();

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
                LetraProveedor letraproveedor = letradao.buscarPorIdletra(amortizacion.getIdletra().getIdletra());
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
    public List<AmortizacionProveedor> listaAmortizaciones(Integer iddeposito) {
        return amortizaciondao.listaPorIddeposito(iddeposito);
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return depositodao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<DepositoProveedor> listaRetorno = depositodao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(depositodao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }
}
