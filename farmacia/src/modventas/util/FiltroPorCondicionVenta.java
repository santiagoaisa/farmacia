package modventas.util;

import com.zarcillo.domain.CondicionVenta;
import org.apache.commons.collections.Predicate;


public class FiltroPorCondicionVenta  implements Predicate {

    Integer criterio;

    public FiltroPorCondicionVenta (Integer criterio) {
        this.criterio = criterio;
    }
    
    @Override
    public boolean evaluate(Object objeto) {
        CondicionVenta condicion=(CondicionVenta) objeto;
        if(condicion.getIdcondicion()==criterio ){
            return true;
        }
        return false;
    }
}