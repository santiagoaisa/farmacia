package com.zarcillo.util.filtro;

import com.zarcillo.domain.LetraProveedor;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorIdproveedorLetraProveedor implements Predicate{
    
    private Integer idproveedor;

    public FiltroPorIdproveedorLetraProveedor(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }
    
    
    

    @Override
    public boolean evaluate(Object o) {
          LetraProveedor lp= (LetraProveedor)o;
          return lp.getIdproveedor().getIdproveedor().equals(idproveedor);
    }
    
}
