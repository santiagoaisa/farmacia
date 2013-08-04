package com.zarcillo.negocio;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.Date;

public class Igv {
    public static BigDecimal Igv(BigDecimal nigv, BigDecimal valorventa) {
        BigDecimal nigvconvertido=nigv.divide(Numero.cien, 2, BigDecimal.ROUND_HALF_UP);        
        return valorventa.multiply(nigvconvertido).setScale(2, BigDecimal.ROUND_HALF_UP);
    }
    public static BigDecimal Importe(BigDecimal nigv, BigDecimal valorventa) {        
        BigDecimal nigvconvertido=nigv.divide(Numero.cien, 2, BigDecimal.ROUND_HALF_UP);
        nigvconvertido=nigvconvertido.add(Numero.uno);        
        return valorventa.multiply(nigvconvertido).setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    
}
