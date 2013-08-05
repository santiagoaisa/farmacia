package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DepositoProveedorDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.DepositoProveedor;
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
    private DepositoProveedorDAO depositoproveedordao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private AmortizacionProveedorDAO amortizaciondao;

    @Override
    @Transactional
    public DepositoProveedor registrar(DepositoProveedor deposito) {
         try {
            deposito.setNsaldo(deposito.getNimporte());            
            deposito.setIdperiodo(periododao.buscarPorFecha(deposito.getDfecha()));
            deposito.setDfecreg(new Date());
            cruddao.registrar(deposito);

            return depositoproveedordao.buscarPorIddeposito(deposito.getIddeposito());
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
    public void eliminar(DepositoProveedor deposito) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DepositoProveedor buscarPorIddeposito(Integer iddeposito) {
        return depositoproveedordao.buscarPorIddeposito(iddeposito);
    }

    @Override
    @Transactional
    public DepositoProveedor amortizar(AmortizacionProveedor amortizacion) {
         DepositoProveedor deposito = new DepositoProveedor();
        BigDecimal nimporteamortizar = new BigDecimal("0");
        try {
            deposito = depositoproveedordao.buscarPorIddeposito(amortizacion.getIddeposito().getIddeposito());
            //
            amortizacion.setDfecreg(new Date());
            amortizacion.setIdperiodo(periododao.buscarPorFecha(amortizacion.getDfecha()));
            amortizacion.setIddeposito(deposito);

            //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
            if (deposito.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                nimporteamortizar = amortizacion.getNimporte();
                amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
            } else {
                //SI CUENTAS PAGAR ES SOLES
                if (deposito.getIdmoneda().getBnacional()) {
                    //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                    if (!amortizacion.getIdmoneda().getBnacional()) {
                        amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                        nimporteamortizar = amortizacion.getNimportes();
                    }
                } else {
                    //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                    if (amortizacion.getIdmoneda().getBnacional()) {
                        nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_EVEN);
                        amortizacion.setIdmoneda(deposito.getIdmoneda());
                        amortizacion.setNimportes(amortizacion.getNimporte());
                        amortizacion.setNimporte(nimporteamortizar);
                    }
                }//FIN SI CUENTAS PAGAR ES SOLES
            }//FIN SI MONEDAS SONIGUALES

            deposito.setNacuenta(deposito.getNacuenta().add(nimporteamortizar));
            deposito.setNsaldo(deposito.getNsaldo().subtract(nimporteamortizar));
            if (Numero.isCero(deposito.getNsaldo())) {
                deposito.setDfeccan(amortizacion.getDfecha());
            }
            cruddao.actualizar(deposito);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

        return depositoproveedordao.buscarPorIddeposito(deposito.getIddeposito());
    }

    @Override
    @Transactional
    public DepositoProveedor desamortizar(AmortizacionProveedor amortizacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AmortizacionProveedor> listaAmortizaciones(Integer iddeposito) {
        return amortizaciondao.listaPorIddeposito(iddeposito);
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return depositoproveedordao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    @Override
    public List<DepositoProveedor> listaPorIdunidadPorIdproveedorPorNanoPendientes(Integer idunidad, Integer idproveedor, Integer nano) {
        List<DepositoProveedor> listaRetorno = depositoproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano - 1);
        listaRetorno.addAll(depositoproveedordao.listaPorIdunidadPorIdproveedorPorNanoPendientes(idunidad, idproveedor, nano));
        return listaRetorno;
    }
}
