package com.zarcillo.util.filtro;

import com.zarcillo.domain.LetraCliente;
import org.apache.commons.collections.Predicate;

/**
 *
 * @author saisa
 */
public class FiltroPorIdclienteLetraCliente  implements Predicate{
    
    private Integer idcliente;

    public FiltroPorIdclienteLetraCliente(Integer idcliente) {
        this.idcliente = idcliente;
    }
    
    @Override
    public boolean evaluate(Object o) {
         LetraCliente lc= (LetraCliente)o;
          return lc.getIdcliente().getIdcliente().equals(idcliente);
    }
    
}
