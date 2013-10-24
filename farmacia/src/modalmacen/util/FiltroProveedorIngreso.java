package modalmacen.util;

import com.zarcillo.domain.RegistroEntrada;
import org.apache.commons.collections.Predicate;


public class FiltroProveedorIngreso implements Predicate {

    Integer criterio;

    public FiltroProveedorIngreso (Integer criterio) {
        this.criterio = criterio;
    }    
    @Override
    public boolean evaluate(Object objeto) {
        RegistroEntrada regent=(RegistroEntrada) objeto;
        if(regent.getIdproveedor().getIdproveedor()==criterio ){
            return true;
        }
        return false;
    }
}
