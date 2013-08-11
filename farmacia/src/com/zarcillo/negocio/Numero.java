package com.zarcillo.negocio;

import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class Numero {

    public static BigDecimal cero = new BigDecimal("0");
    public static BigDecimal uno = new BigDecimal("1");
    public static BigDecimal diez = new BigDecimal("10");
    public static BigDecimal cien = new BigDecimal("100");

    public static boolean isCero(BigDecimal nvalor) {
        return nvalor.compareTo(BigDecimal.ZERO) == 0;
    }
    
    public static boolean isIgual(BigDecimal nmonto1,BigDecimal nmonto2) {
        return nmonto1.compareTo(nmonto2) == 0;
    }
    
    public static boolean isMayorIgual(BigDecimal nnumero,BigDecimal ncomparado) {        
        return nnumero.compareTo(ncomparado)>= 0;
    }
    
    public static boolean isMayor(BigDecimal nnumero,BigDecimal ncomparado) {        
        return nnumero.compareTo(ncomparado)> 0;
    }
}
