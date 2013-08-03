package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Periodo;
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
    public List<CuentaPagar> listaPorIdunidadPorIdproveedorPorNano(String idunidad, String idproveedor, Integer nano) {
        return cuentapagardao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }
}
