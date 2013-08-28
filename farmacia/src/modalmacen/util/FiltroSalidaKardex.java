package modalmacen.util;

import com.zarcillo.dto.almacen.Kardex;
import org.apache.commons.collections.Predicate;


public class FiltroSalidaKardex  implements Predicate {
    @Override
    public boolean evaluate(Object objeto) {
        Kardex kardex=(Kardex) objeto;
        if(kardex.getCtipmov().contains("S")&&(!kardex.getCserfac().contains("TRA"))){
            return true;
        }
        return false;
    }
}