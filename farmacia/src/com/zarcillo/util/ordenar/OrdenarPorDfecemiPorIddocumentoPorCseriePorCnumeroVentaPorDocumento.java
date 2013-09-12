package com.zarcillo.util.ordenar;

import com.zarcillo.estadistica.VentaPorDocumento;
import java.util.Comparator;

/**
 *
 * @author saisa
 */
public class OrdenarPorDfecemiPorIddocumentoPorCseriePorCnumeroVentaPorDocumento implements Comparator {

    @Override
    public int compare(Object o1, Object o2) {
        VentaPorDocumento v1 = (VentaPorDocumento) o1;
        VentaPorDocumento v2 = (VentaPorDocumento) o2;

        String c1 = v1.getDfecemi().toString() + " - " + v1.getIddocumento().getIddocumento()+" - "+v1.getCserie().trim()+" - "+v1.getCnumero().trim();
        String c2 = v2.getDfecemi().toString() + " - " + v2.getIddocumento().getIddocumento()+" - "+v2.getCserie().trim()+" - "+v2.getCnumero().trim();

        return c1.compareTo(c2);
    }
    
}
