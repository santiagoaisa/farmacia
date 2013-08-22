package com.zarcillo.util.ordenar;

import com.zarcillo.domain.Cliente;
import java.util.Comparator;

/**
 *
 * @author saisa
 */
public class OrdenarPorCnomcliCliente implements Comparator {

    @Override
    public int compare(Object o1, Object o2) {
        Cliente c1 = (Cliente) o1;
        Cliente c2 = (Cliente) o2;
        return c1.getCnomcli().compareTo(c2.getCnomcli());
    }
    
}
