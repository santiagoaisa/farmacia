package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.ChequeProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.NotaboProveedorDAO;
import com.zarcillo.dao.NotcarProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.ChequeProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.NotaboProveedor;
import com.zarcillo.domain.NotcarProveedor;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@Service("cuentaPagarService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CuentaPagarServiceImpl implements CuentaPagarService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private CuentaPagarDAO cuentapagardao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;

    @Override
    @Transactional
    public CuentaPagar registrar(CuentaPagar cuentapagar) {
        try {
            cuentapagar.setNsaldo(cuentapagar.getNimporte().add(cuentapagar.getNpercepcion()));
            cuentapagar.setNtotalreclamo(cuentapagar.getNreclamodevolucion().add(cuentapagar.getNreclamoprecio()));
            cuentapagar.setIdperiodo(periododao.buscarPorFecha(cuentapagar.getDfecemi()));
            cuentapagar.setDfecreg(new Date());
            cruddao.registrar(cuentapagar);

            return cuentapagardao.buscarPorIdcuenta(cuentapagar.getIdcuenta());
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    public CuentaPagar buscarPorIdcuenta(Integer idcuenta) {
        return cuentapagardao.buscarPorIdcuenta(idcuenta);
    }

    @Override
    public CuentaPagar buscarPorIdregentrada(Integer idregentrada) {
        try {
            return cuentapagardao.buscarPorIdregentrada(idregentrada);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe el Ingreso :" + idregentrada);
        }
    }

    @Override
    @Transactional
    public CuentaPagar actualizar(CuentaPagar cuentapagar) {
        try {
            BigDecimal nresta = cuentapagar.getNacuenta().add(cuentapagar.getNnotabo());
            BigDecimal nsuma = cuentapagar.getNnotcar().add(cuentapagar.getNpercepcion());
            cuentapagar.setNsaldo(cuentapagar.getNimporte().subtract(nresta).add(nsuma));
            cruddao.actualizar(cuentapagar);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
        return cuentapagar;
    }

    @Override
    @Transactional
    public void eliminar(CuentaPagar cp) {
        CuentaPagar cuentapagar;
        try {
            cuentapagar = cuentapagardao.buscarPorIdcuenta(cp.getIdcuenta());

            if (cuentapagar.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!Numero.isIgual(cuentapagar.getNimporte(), cuentapagar.getNsaldo())) {
                throw new ExceptionZarcillo("El documento tiene amortizaciones imposible eliminar");
            }

            cruddao.eliminar(cuentapagar);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    @Transactional
    public CuentaPagar amortizar(AmortizacionProveedor amortizacion) {
        CuentaPagar cuentapagar = new CuentaPagar();
        BigDecimal nimporteamortizar = new BigDecimal("0");
        try {
            cuentapagar = cuentapagardao.buscarPorIdcuenta(amortizacion.getIdcuenta().getIdcuenta());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
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

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return cuentapagardao.buscarPorIdcuenta(cuentapagar.getIdcuenta());
    }

    @Override
    @Transactional
    public CuentaPagar desamortizar(AmortizacionProveedor amortizacion) {

        CuentaPagar cuentapagar = new CuentaPagar();
        BigDecimal nimportedesamortizar = new BigDecimal("0");

        try {
            cuentapagar = cuentapagardao.buscarPorIdcuenta(amortizacion.getIdcuenta().getIdcuenta());

            if (amortizacion.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado imposible eliminar ");
            }

            if (!amortizacion.getIdtipo().getBpago()) {
                throw new ExceptionZarcillo("Elimine la Amortizacion desde la pestaña " + amortizacion.getIdtipo());
            }
            //


            //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (cuentapagar.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimportedesamortizar = amortizacion.getNimporte();
            } else {
                //SI CUENTAS PAGAR ES SOLES
                if (cuentapagar.getIdmoneda().getBnacional()) {
                    //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimporte().multiply(amortizacion.getNtipocambio());
                    }
                } else {
                    //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimportedesamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
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
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
        return cuentapagardao.buscarPorIdcuenta(cuentapagar.getIdcuenta());
    }

    @Override
    public List<AmortizacionProveedor> listaAmortizaciones(Integer idcuenta) {
        return amortizaciondao.listaPorIdcuenta(idcuenta);
    }

    @Override
    @Transactional(readOnly = true)
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return cuentapagardao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<CuentaPagar> listaRetorno = cuentapagardao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(cuentapagardao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }
}
