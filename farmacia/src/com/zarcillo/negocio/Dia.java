package com.zarcillo.negocio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author saisa
 */
public class Dia {

    private static List<String> listaDiaSemana = new ArrayList<String>() {
        {
            add("DOMINGO");
            add("LUNES");
            add("MARTES");
            add("MIERCOLES");
            add("JUEVES");
            add("VIERNES");
            add("SABADO");
        }
    };
    private static GregorianCalendar date1 = new GregorianCalendar();
    private static GregorianCalendar date2 = new GregorianCalendar();

    public static Date sumarDias(Date dfecha, Integer ndias) {
        Calendar calendario = Calendar.getInstance();
        calendario.setTime(dfecha);
        calendario.add(Calendar.DAY_OF_MONTH, ndias);
        return calendario.getTime();
    }

    public static List<Date> listaFechas(Date fecha1, Date fecha2) {
        List<Date> listaFechas = new ArrayList<>();

        Calendar calendario = Calendar.getInstance();

        while (fecha1.compareTo(fecha2) <= 0) {
            listaFechas.add(fecha1);
            calendario.setTime(fecha1);
            calendario.add(Calendar.DAY_OF_YEAR, 1);
            fecha1 = calendario.getTime();
        }
        return listaFechas;
    }

    public static int dias(Date fecha1, Date fecha2) {
        int dias = 0;

        date1.setTime(fecha1);
        date2.setTime(fecha2);

        if (date1.get(Calendar.YEAR) == date2.get(Calendar.YEAR)) {
            dias = date2.get(Calendar.DAY_OF_YEAR) - date1.get(Calendar.DAY_OF_YEAR);
        } else {
            /*
             * SI ESTAMOS EN DISTINTO ANYO COMPROBAMOS QUE EL ANYO DEL DATEINI
             * NO SEA BISIESTO SI ES BISIESTO SON 366 DIAS EL ANYO SINO SON 365
             */
            int diasAnyo = date1.isLeapYear(date1.get(Calendar.YEAR)) ? 366 : 365;

            /*
             * CALCULAMOS EL RANGO DE ANYOS
             */
            int rangoAnyos = date2.get(Calendar.YEAR) - date1.get(Calendar.YEAR);

            /*
             * CALCULAMOS EL RANGO DE DIAS QUE HAY
             */
            dias = (rangoAnyos * diasAnyo) + (date2.get(Calendar.DAY_OF_YEAR) - date1.get(Calendar.DAY_OF_YEAR));

        }

        return dias;
    }

    public static int años(Date fecha1, Date fecha2) {
        int dias = 0;
        int años = 0;
        date1.setTime(fecha1);
        date2.setTime(fecha2);

        if (date1.get(Calendar.YEAR) == date2.get(Calendar.YEAR)) {
            dias = date2.get(Calendar.DAY_OF_YEAR) - date1.get(Calendar.DAY_OF_YEAR);

            int diasAnyo = date1.isLeapYear(date1.get(Calendar.YEAR)) ? 366 : 365;

            años = dias / diasAnyo;
        } else {
            /*
             * SI ESTAMOS EN DISTINTO ANYO COMPROBAMOS QUE EL ANYO DEL DATEINI
             * NO SEA BISIESTO SI ES BISIESTO SON 366 DIAS EL ANYO SINO SON 365
             */
            int diasAnyo = date1.isLeapYear(date1.get(Calendar.YEAR)) ? 366 : 365;

            /*
             * CALCULAMOS EL RANGO DE ANYOS
             */
            int rangoAnyos = date2.get(Calendar.YEAR) - date1.get(Calendar.YEAR);

            /*
             * CALCULAMOS EL RANGO DE DIAS QUE HAY
             */
            dias = (rangoAnyos * diasAnyo) + (date2.get(Calendar.DAY_OF_YEAR) - date1.get(Calendar.DAY_OF_YEAR));

            años = dias / diasAnyo;
        }

        return años;
    }

    public static String diaSemana(int index) {
        return listaDiaSemana.get(index);
    }
}
