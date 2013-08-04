package com.zarcillo.negocio;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author saisa
 */
public class Dia {

    public static Date sumarDias(Date dfecha, Integer ndias) {
        Calendar calendario = Calendar.getInstance();
        calendario.setTime(dfecha);
        calendario.add(Calendar.DAY_OF_MONTH, ndias);
        return calendario.getTime();
    }
}
