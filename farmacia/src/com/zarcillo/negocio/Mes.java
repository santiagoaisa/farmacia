package com.zarcillo.negocio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Mes {

    private static List<String> lista = new ArrayList<String>();
    private static List<String> listaIniciales = new ArrayList<String>();
    
    public static Integer ENERO = new Integer(1);
    public static Integer FEBRERO = new Integer(2);
    public static Integer MARZO = new Integer(3);
    public static Integer ABRIL = new Integer(4);
    public static Integer MAYO = new Integer(5);
    public static Integer JUNIO = new Integer(6);
    public static Integer JULIO = new Integer(7);
    public static Integer AGOSTO = new Integer(8);
    public static Integer SETIEMBRE = new Integer(9);
    public static Integer OCTUBRE = new Integer(10);
    public static Integer NOVIEMBRE = new Integer(11);
    public static Integer DICIEMBRE = new Integer(12);

    public List<String> getMeses() {
        return lista;
    }

    public static List<String> listaMeses() {

        List<String> listaMeses = new ArrayList<String>();
        listaMeses.add("ENERO");
        listaMeses.add("FEBRERO");
        listaMeses.add("MARZO");
        listaMeses.add("ABRIL");
        listaMeses.add("MAYO");
        listaMeses.add("JUNIO");
        listaMeses.add("JULIO");
        listaMeses.add("AGOSTO");
        listaMeses.add("SETIEMBRE");
        listaMeses.add("OCTUBRE");
        listaMeses.add("NOVIEMBRE");
        listaMeses.add("DICIEMBRE");

        return listaMeses;
    }

    public static String getMes(Date fecha) {
        Calendar calendario = Calendar.getInstance();
        calendario.setTime(fecha);
        int mes = calendario.get(Calendar.MONTH);
        llenarMeses();
        return lista.get(mes);

    }

    public static String getMes(Integer index) {

        String retorno = "";

        if (index < 0) {

            retorno = "";
        } else {
            llenarMeses();
            if (index == 0) {
                index = 14;
            }

            retorno = " | " + lista.get(index - 1);

        }


        return retorno;
    }

    public static String getMes(String cmes) {
        int index = Integer.valueOf(cmes.trim());
        llenarMeses();

        if (index == 0) {
            index = 14;
        }



        return lista.get(index - 1);
    }

    public static String getMesMatrix(String cmes) {
        int index = Integer.valueOf(cmes.trim());
        llenarMeses();
        llenarIniciales();
        return listaIniciales.get(index - 1) + "-" + lista.get(index - 1);
    }

    private static void llenarMeses() {
        lista.add("ENERO");
        lista.add("FEBRERO");
        lista.add("MARZO");
        lista.add("ABRIL");
        lista.add("MAYO");
        lista.add("JUNIO");
        lista.add("JULIO");
        lista.add("AGOSTO");
        lista.add("SETIEMBRE");
        lista.add("OCTUBRE");
        lista.add("NOVIEMBRE");
        lista.add("DICIEMBRE");
        lista.add("FINAL");
        lista.add("INICIAL");
    }

    private static void llenarIniciales() {
        listaIniciales.add("A");
        listaIniciales.add("B");
        listaIniciales.add("C");
        listaIniciales.add("D");
        listaIniciales.add("E");
        listaIniciales.add("F");
        listaIniciales.add("G");
        listaIniciales.add("H");
        listaIniciales.add("I");
        listaIniciales.add("J");
        listaIniciales.add("K");
        listaIniciales.add("L");
    }
}
