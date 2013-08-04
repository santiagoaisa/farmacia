package com.zarcillo.service;

import com.zarcillo.domain.ChequeCliente;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ChequeClienteService {
    
     public ChequeCliente registrar(ChequeCliente cheque);
    public ChequeCliente actualizar(ChequeCliente cheque);
    public void eliminar(ChequeCliente cheque);
    public ChequeCliente buscar(Integer idcheque);
    public List<ChequeCliente> listaPorIdunidadPorIdclientePorNano(String idunidad,Integer idcliente,Integer nano);
    
}
