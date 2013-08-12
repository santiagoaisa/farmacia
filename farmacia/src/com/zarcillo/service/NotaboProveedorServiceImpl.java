package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.LetraProveedorDAO;
import com.zarcillo.dao.NotaboProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.domain.NotaboProveedor;
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
@Service("notaboProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NotaboProveedorServiceImpl implements NotaboProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotaboProveedorDAO notaboproveedordao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private LetraProveedorDAO letraproveedordao;

    @Override
    public NotaboProveedor buscarPorIdnotabo(Integer idnotabo) {
        return notaboproveedordao.buscarPorIdnotabo(idnotabo);
    }

    @Override
    @Transactional
    public NotaboProveedor registrar(NotaboProveedor notabo) {
        try {
            notabo.setNsaldo(notabo.getNimporte());
            notabo.setIdperiodo(periododao.buscarPorFecha(notabo.getDfecemi()));
            notabo.setDfecreg(new Date());
            cruddao.registrar(notabo);

            return notaboproveedordao.buscarPorIdnotabo(notabo.getIdnotabo());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public NotaboProveedor actualizar(NotaboProveedor notabo) {
        try {
            cruddao.actualizar(notabo);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return notabo;
    }

    @Override
    @Transactional
    public void eliminar(NotaboProveedor nt) {
          NotaboProveedor notabo;
        try {
            notabo = notaboproveedordao.buscarPorIdnotabo(nt.getIdnotabo());

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
    public NotaboProveedor amortizar(AmortizacionProveedor amortizacion) {
        NotaboProveedor notabo = new NotaboProveedor();

        BigDecimal nimporteamortizar = amortizacion.getNimporte();
        BigDecimal nimporteamortizarnotabo = amortizacion.getNimporte();
        try {
            notabo = notaboproveedordao.buscarPorIdnotabo(amortizacion.getIdnotabo().getIdnotabo());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIdnotabo(notabo);

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
                letraproveedor.setNnotabo(letraproveedor.getNnotabo().add(nimporteamortizar));
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
                cuentapagar.setNnotabo(cuentapagar.getNnotabo().add(nimporteamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

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

        return notaboproveedordao.buscarPorIdnotabo(notabo.getIdnotabo());
    }

    @Override
    @Transactional
    public NotaboProveedor desamortizar(AmortizacionProveedor amortizacion) {
        NotaboProveedor notabo = new NotaboProveedor();

        BigDecimal nimportedesamortizar = amortizacion.getNimporte();
        BigDecimal nimportedesamortizarnotabo = amortizacion.getNimporte();
        try {
            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            notabo = notaboproveedordao.buscarPorIdnotabo(amortizacion.getIdnotabo().getIdnotabo());

            //SI EL DEPOSITO ES EN SOLES
            if (notabo.getIdmoneda().getBnacional()) {
                nimportedesamortizarnotabo = amortizacion.getNimportes();
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
                letraproveedor.setNnotabo(letraproveedor.getNnotabo().subtract(nimportedesamortizar));
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
                cuentapagar.setNnotabo(cuentapagar.getNnotabo().subtract(nimportedesamortizar));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(nimportedesamortizar));
                cuentapagar.setDfeccan(null);
                if (Numero.isCero(cuentapagar.getNsaldo())) {
                    cuentapagar.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(cuentapagar);

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

        return notaboproveedordao.buscarPorIdnotabo(notabo.getIdnotabo());
    }

    @Override
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idnotabo) {
        return amortizaciondao.listaPorIdnotabo(idnotabo);
    }

    @Override
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return notaboproveedordao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<NotaboProveedor> listaRetorno = notaboproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(notaboproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }
}
