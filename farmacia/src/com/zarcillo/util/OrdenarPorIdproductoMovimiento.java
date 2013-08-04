package com.zarcillo.util;


import com.zarcillo.domain.Movimiento;
import java.util.Comparator;


public class OrdenarPorIdproductoMovimiento implements Comparator{

    public int compare(Object o1, Object o2) {
        Movimiento m1=(Movimiento)o1;
        Movimiento m2=(Movimiento)o2;
        return m2.getExistencia().getIdproducto().getIdproducto().compareTo(m1.getExistencia().getIdproducto().getIdproducto());
    }


}
