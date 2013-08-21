package com.zarcillo.util.ordenar;

import com.zarcillo.dto.almacen.Kardex;
import java.util.Comparator;

public class OrdenarPorIdmovimientoKardex implements Comparator {

    public int compare(Object o1, Object o2) {
        Kardex m1 = (Kardex) o1;
        Kardex m2 = (Kardex) o2;

        String c1 = m1.getDfecmov().toString() + " - " + m1.getId();
        String c2 = m2.getDfecmov().toString() + " - " + m2.getId();

        return c1.compareTo(c2);
    }
}
