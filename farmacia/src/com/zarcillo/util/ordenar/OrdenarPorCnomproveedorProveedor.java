package com.zarcillo.util.ordenar;

import com.zarcillo.domain.Proveedor;
import java.util.Comparator;

/**
 *
 * @author saisa
 */
public class OrdenarPorCnomproveedorProveedor implements Comparator {

    @Override
    public int compare(Object o1, Object o2) {
        Proveedor p1 = (Proveedor) o1;
        Proveedor p2 = (Proveedor) o2;
        return p1.getCnomprovee().compareTo(p2.getCnomprovee());
    }
}
