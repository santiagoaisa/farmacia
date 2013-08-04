package com.zarcillo.service;

import com.zarcillo.domain.ChequeProveedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface ChequeProveedorService {
      public ChequeProveedor registrar(ChequeProveedor cheque);
    public ChequeProveedor actualizar(ChequeProveedor cheque);
    public void eliminar(ChequeProveedor cheque);
    public ChequeProveedor buscar(Integer idcheque);
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor,Integer nano);
}
