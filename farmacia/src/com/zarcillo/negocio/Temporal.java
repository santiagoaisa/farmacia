/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zarcillo.negocio;

import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class Temporal {
    public static BigDecimal sumaDescuento(BigDecimal nbon1, BigDecimal nbon2) {
        /////////
        BigDecimal cien = new BigDecimal("100");
        BigDecimal cero = new BigDecimal("0");
        BigDecimal descuento = new BigDecimal("0");

        Integer rpta1 = nbon1.compareTo(cero);
        Integer rpta2 = nbon1.compareTo(cero);


        if (rpta1 == 0 && rpta2 == 0) {
            return descuento;
        }

        descuento = cien.multiply(nbon2);
        descuento = descuento.divide(nbon1.add(nbon2), 2, BigDecimal.ROUND_HALF_UP);

        return descuento.setScale(2, BigDecimal.ROUND_HALF_UP);
    }
   
}
