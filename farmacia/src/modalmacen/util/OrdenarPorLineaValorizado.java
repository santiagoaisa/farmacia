package modalmacen.util;

import com.zarcillo.dto.almacen.InventarioValorizado;
import java.util.Comparator;

public class OrdenarPorLineaValorizado implements Comparator {
    @Override
    public int compare(Object o1, Object o2) {
        InventarioValorizado m1=(InventarioValorizado) o1;
        InventarioValorizado m2=(InventarioValorizado) o2;
        return m1.getIdlinea().getCnomlinea().compareTo(m2.getIdlinea().getCnomlinea());
    }

}
