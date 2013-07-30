package com.zarcillo.service;

import java.lang.reflect.Field;

/**
 *
 * @author saisa
 */
public class LogZarcillo {

    public static String log( Object objeto) {
        String cretorno = "[";
        try {
            Class klass = objeto.getClass();
            Field properties[] = klass.getDeclaredFields();
            String cpropiedad;
            for (int i = 1; i < properties.length; i++) {
                Field field = properties[i];
                field.setAccessible(true);
                cpropiedad = field.getName().toUpperCase();
                if (cpropiedad.toUpperCase().contains("IDUSUARIO") || cpropiedad.contains("DFECREG")) {
                    continue;
                }
                cretorno = cretorno + "" + cpropiedad + ":" + field.get(objeto) + "|";
            }
            cretorno = cretorno + "]";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cretorno;
    }
}
