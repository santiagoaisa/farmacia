package com.zarcillo.service;

import com.zarcillo.dao.CuentaPagarDAO;
import com.zarcillo.dto.finanzas.CronogramaPago;
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
@Service("listadoProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ListadoProveedorServiceImpl implements ListadoProveedorService {

    @Autowired
    private CuentaPagarDAO cuentapagardao;

    @Override
    @Transactional
    public List<CronogramaPago> listaCronogramaPago(Date dhasta) {
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
