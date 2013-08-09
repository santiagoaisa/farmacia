package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotaboCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotaboClienteDAO {
    
     MotivoNotaboCliente busqueda(Integer idmotivo);
     List<MotivoNotaboCliente> listaGeneral();
    
}
