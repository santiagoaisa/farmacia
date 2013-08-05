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
    @Autowired
    private ChequeProveedorDAO chequeproveedordao;
    @Autowired
    private NotaboProveedorDAO notabodao;
    @Autowired
    private NotcarProveedorDAO notcardao;

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
    public void eliminar(CuentaPagar cp) {
        CuentaPagar cuentapagar;
        try {
            cuentapagar = cuentapagardao.buscarPorIdcuenta(cp.getIdcuenta());

            if (cuentapagar.getIdperiodo().getBinactivo()) {
                throw new ExceptionZarcillo("El periodo ya esta cerrado\n imposible eliminar ");
            }

            List<AmortizacionProveedor> listaAmortizacion = amortizaciondao.listaPorIdcuenta(cp.getIdcuenta());

            for (AmortizacionProveedor amortizacion : listaAmortizacion) {
                //si es cheque
                if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.CHEQUE_SUNAT.getCcodigosunat())) {
                    ChequeProveedor cheque = amortizacion.getIdcheque();
                    cheque.setNacuenta(cheque.getNacuenta().subtract(amortizacion.getNimporte()));
                    cheque.setNsaldo(cheque.getNsaldo().add(amortizacion.getNimporte()));

                    cuentapagar.setNacuenta(cuentapagar.getNacuenta().subtract(amortizacion.getNimporte()));
                    cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(amortizacion.getNimporte()));
                    cruddao.actualizar(cheque);
                }

                //si es nota de credito
                if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.NOTA_CREDITO_SUNAT.getCcodigosunat())) {
                    NotaboProveedor ntp = amortizacion.getIdnotabo();
                    ntp.setNacuenta(ntp.getNacuenta().subtract(amortizacion.getNimporte()));
                    ntp.setNsaldo(ntp.getNsaldo().add(amortizacion.getNimporte()));
                    //como es nota de credito
                    cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(amortizacion.getNimporte()));
                    cuentapagar.setNnotabo(cuentapagar.getNnotabo().subtract(amortizacion.getNimporte()));
                    cruddao.actualizar(ntp);
                }

                //si es nota de debito
                if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.NOTA_DEBITO_SUNAT.getCcodigosunat())) {
                    NotcarProveedor ntp = amortizacion.getIdnotcar();
                    ntp.setNacuenta(ntp.getNacuenta().subtract(amortizacion.getNimporte()));
                    ntp.setNsaldo(ntp.getNsaldo().add(amortizacion.getNimporte()));

                    //como es nota de debito
                    cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(amortizacion.getNimporte()));
                    cuentapagar.setNnotcar(cuentapagar.getNnotcar().subtract(amortizacion.getNimporte()));
                    cruddao.actualizar(ntp);
                }

                //si es letra
                if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.LETRA_CAMBIO_SUNAT.getCcodigosunat())) {
                    throw new ExceptionZarcillo("Imposible eliminar la Letra\nElimine la Liquidacion");
                }

                cruddao.eliminar(amortizacion);
            }

            cruddao.eliminar(cuentapagar);

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
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
            if (Numero.IsCero(cuentapagar.getNsaldo())) {
                cuentapagar.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(cuentapagar);

            //si es cheque
            if (amortizacion.getIdtipo().getCcodigosunat().equals(TipoPago.CHEQUE_SUNAT.getCcodigosunat())) {
                cuentapagar.setNacuenta(cuentapagar.getNacuenta().add(amortizacion.getNimporte()));
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(amortizacion.getNimporte()));

                ChequeProveedor cheque = chequeproveedordao.busqueda(amortizacion.getIdcheque().getIdcheque());
                amortizacion.setIdbanco(cheque.getIdbanco());
                if (!cheque.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        BigDecimal nimportedolares = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        amortizacion.setNimporte(nimportedolares);
                    } else {
                        BigDecimal nimportedolares = amortizacion.getNimporte().multiply(amortizacion.getNtipocambio());
                        amortizacion.setNimporte(nimportedolares);
                    }
                }

                cheque.setNacuenta(cheque.getNacuenta().add(amortizacion.getNimporte()));
                cheque.setNsaldo(cheque.getNsaldo().subtract(amortizacion.getNimporte()));
                cruddao.actualizar(cheque);
            }

            //si es nota de credito
            if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.NOTA_CREDITO_SUNAT.getCcodigosunat())) {
                NotaboProveedor ntp = notabodao.busqueda(amortizacion.getIdnotabo().getIdnotabo());
                ntp.setNacuenta(ntp.getNacuenta().add(amortizacion.getNimporte()));
                ntp.setNsaldo(ntp.getNsaldo().subtract(amortizacion.getNimporte()));

                //devuelvo el acuenta porque es nota de credito
                cuentapagar.setNsaldo(cuentapagar.getNsaldo().subtract(amortizacion.getNimporte()));
                cuentapagar.setNnotabo(cuentapagar.getNnotabo().add(amortizacion.getNimporte()));

                cruddao.actualizar(ntp);
            }

            //si es nota de debito
            if (amortizacion.getIdtipo().getCcodigosunat().contains(TipoPago.NOTA_CREDITO_SUNAT.getCcodigosunat())) {
                NotcarProveedor ntp = notcardao.busqueda(amortizacion.getIdnotcar().getIdnotcar());
                ntp.setNacuenta(ntp.getNacuenta().add(amortizacion.getNimporte()));
                ntp.setNsaldo(ntp.getNsaldo().subtract(amortizacion.getNimporte()));


                cuentapagar.setNsaldo(cuentapagar.getNsaldo().add(amortizacion.getNimporte()));
                cuentapagar.setNnotcar(cuentapagar.getNnotcar().add(amortizacion.getNimporte()));

                cruddao.actualizar(ntp);
            }

            //si es redondeo
//            if (amortizacion.getIdtipo().getIdtipo().equals(TipoPagoProveedor.REDONDEO.getIdtipo())) {
//                cuentaspagar.setNacuenta(cuentaspagar.getNacuenta().add(amortizacion.getNimporte()));
//                cuentaspagar.setNsaldo(cuentaspagar.getNsaldo().subtract(amortizacion.getNimporte()));
//            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return cuentapagardao.buscarPorIdcuenta(cuentapagar.getIdcuenta());
    }

    @Override
    public CuentaPagar desamortizar(AmortizacionProveedor amortizacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
}
