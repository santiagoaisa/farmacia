package com.zarcillo.util.filtro;

import com.zarcillo.domain.Movimiento;
import java.util.Date;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorIdproductoPorDfechaMovimiento implements Predicate  {
    
    private Date dfecha;
    private String idproducto;

    public FiltroPorIdproductoPorDfechaMovimiento(Date dfecha, String idproducto) {
        this.dfecha = dfecha;
        this.idproducto = idproducto;
    }

    @Override
    public boolean evaluate(Object o) {
         Movimiento m = (Movimiento) o;
        return m.getIdregsalida().getDfecha().equals(dfecha) && m.getIdproducto().getIdproducto().contains(idproducto);
    }
    
    
    
}
