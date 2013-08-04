package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.NotcarProveedorDAO;
import com.zarcillo.domain.NotcarProveedor;
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
public class NotcarProveedorServiceImpl implements NotcarProveedorService{
    
    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotcarProveedorDAO notcardao;

    @Override
     @Transactional(readOnly = true)
    public List<NotcarProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return notcardao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }
    
}
