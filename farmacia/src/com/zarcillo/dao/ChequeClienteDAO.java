package com.zarcillo.dao;

import com.zarcillo.domain.ChequeCliente;
import java.util.List;
/**
 *
 * @author saisa
 */
public interface ChequeClienteDAO {
     ChequeCliente busqueda(Integer idcheque);
    List<ChequeCliente> listaPorIdcliente(Integer idcliente);
}
