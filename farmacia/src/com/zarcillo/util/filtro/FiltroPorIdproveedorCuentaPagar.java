package com.zarcillo.util.filtro;

import com.zarcillo.domain.CuentaPagar;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorIdproveedorCuentaPagar implements Predicate{
    
    private Integer idproveedor;

    public FiltroPorIdproveedorCuentaPagar(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }
    
    
    

    @Override
    public boolean evaluate(Object o) {
          CuentaPagar cp= (CuentaPagar)o;
          return cp.getIdproveedor().getIdproveedor().equals(idproveedor);
    }
    
}
