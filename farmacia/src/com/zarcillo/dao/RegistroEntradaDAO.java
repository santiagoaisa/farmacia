package com.zarcillo.dao;

import com.zarcillo.domain.RegistroEntrada;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface RegistroEntradaDAO {
    RegistroEntrada busqueda(Integer idregentrada);
    RegistroEntrada buscarPorIdalmacenPorIdregentrada(Integer idalmacen,Integer idregentrada);
    
     List<RegistroEntrada> listaPorFechas(Integer idalmacen,Date dfecha1,Date dfecha2);
     List<RegistroEntrada> listaPorIdalmacenPorIdproveedorPorNano(Integer idalmacen,Integer idproveedor,Integer nano);
}
