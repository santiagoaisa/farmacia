package com.zarcillo.util.filtro;

import com.zarcillo.domain.ComprobanteEmitido;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorIdclienteComprobanteEmitido implements Predicate {

    private Integer idcliente;

    public FiltroPorIdclienteComprobanteEmitido(Integer idcliente) {
        this.idcliente = idcliente;
    }

    @Override
    public boolean evaluate(Object o) {
        ComprobanteEmitido ce = (ComprobanteEmitido) o;
        return ce.getIdcliente().getIdcliente().equals(idcliente);
    }
}
