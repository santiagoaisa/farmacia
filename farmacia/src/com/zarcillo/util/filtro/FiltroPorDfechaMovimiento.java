package com.zarcillo.util.filtro;

import com.zarcillo.domain.Movimiento;
import java.io.Serializable;
import java.util.Date;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorDfechaMovimiento implements Predicate {

    private Date dfecha;

    public FiltroPorDfechaMovimiento(Date dfecha) {
        this.dfecha = dfecha;
    }

    @Override
    public boolean evaluate(Object o) {
        Movimiento m = (Movimiento) o;
        return m.getIdregsalida().getDfecha().equals(dfecha);
    }
}
