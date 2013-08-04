
package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.NotaboProveedorDAO;
import com.zarcillo.domain.NotaboProveedor;
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
public class NotaboProveedorServiceImpl implements NotaboProveedorService{
    
    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NotaboProveedorDAO notabodao;

    @Override
     @Transactional(readOnly = true)
    public List<NotaboProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return notabodao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }
    
    
    
    
}
