package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.LetraProveedorDAO;
import com.zarcillo.dao.NotcarProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.domain.NotcarProveedor;
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
@Service("notcarProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotcarProveedorServiceImpl implements NotcarProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotcarProveedorDAO notcarproveedordao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private LetraProveedorDAO letraproveedordao;

    @Override
    public NotcarProveedor buscarPorIdnotcar(Integer idnotcar) {
        return notcarproveedordao.buscarPorIdnotcar(idnotcar);
    }

    @Override
    @Transactional
    public NotcarProveedor registrar(NotcarProveedor notcar) {
        try {
            notcar.setNsaldo(notcar.getNimporte());
            notcar.setIdperiodo(periododao.buscarPorFecha(notcar.getDfecemi()));
            notcar.setDfecreg(new Date());
            cruddao.registrar(notcar);

            return notcarproveedordao.buscarPorIdnotcar(notcar.getIdnotcar());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public NotcarProveedor actualizar(NotcarProveedor notcar) {
        try {
            cruddao.actualizar(notcar);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return notcar;
    }

    @Override
    @Transactional
    public void eliminar(NotcarProveedor nt) {
        NotcarProveedor notcar;
        try {
            notcar = notcarproveedordao.buscarPorIdnotcar(nt.getIdnotcar());

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
    public NotcarProveedor amortizar(AmortizacionProveedor amortizacion) {
        NotcarProveedor notcar = new NotcarProveedor();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarnotcar = amortizacion.getNimporte();
        try {
            notcar = notcarproveedordao.buscarPorIdnotcar(amortizacion.getIdnotcar().getIdnotcar());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdnotcar(notcar);

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
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                            amortizacion.setIdmoneda(letraproveedor.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letraproveedor.setNnotcar(letraproveedor.getNnotcar().add(nimporteamortizar));
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
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                            amortizacion.setIdmoneda(cuentapagar.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI CUENTAS PAGAR ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                cuentapagar.setNnotcar(cuentapagar.getNnotcar().add(nimporteamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

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

        return notcarproveedordao.buscarPorIdnotcar(notcar.getIdnotcar());
    }

    @Override
    @Transactional
    public NotcarProveedor desamortizar(AmortizacionProveedor amortizacion) {
        NotcarProveedor notcar = new NotcarProveedor();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarnotcar = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            notcar = notcarproveedordao.buscarPorIdnotcar(amortizacion.getIdnotcar().getIdnotcar());

            //SI EL DEPOSITO ES EN SOLES
            if (notcar.getIdmoneda().getBnacional()) {
                nimportedesamortizarnotcar = amortizacion.getNimportes();
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                        }
                    }//FIN SI LETRA ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                letraproveedor.setNnotcar(letraproveedor.getNnotcar().subtract(nimportedesamortizar));
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
                            nimportedesamortizar = amortizacion.getNimportes().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                        }
                    }//FIN SI CUENTAS PAGAR ES SOLES
                }//FIN SI MONEDAS SONIGUALES
                cuentapagar.setNnotcar(cuentapagar.getNnotcar().subtract(nimportedesamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(nimportedesamortizar));
                cuentapagar.setDfeccan(null);
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

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

        return notcarproveedordao.buscarPorIdnotcar(notcar.getIdnotcar());
    }

    @Override
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idnotcar) {
        return amortizaciondao.listaPorIdnotcar(idnotcar);
    }

    @Override
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return notcarproveedordao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<NotcarProveedor> listaRetorno = notcarproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(notcarproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }
}
