package com.zarcillo.dao;

import com.zarcillo.domain.MotivoNotcarCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoNotcarClienteDAO {
    MotivoNotcarCliente busqueda(Integer idmotivo);
    List<MotivoNotcarCliente> listaGeneral();
}
