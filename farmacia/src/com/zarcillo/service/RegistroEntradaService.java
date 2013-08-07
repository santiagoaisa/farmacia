package com.zarcillo.service;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.dto.almacen.DetalleIngreso;
import java.util.Date;
import java.util.List;
 
/**
 *
 * @author saisa
 */
public interface RegistroEntradaService {
    public RegistroEntrada registrarIngreso(RegistroEntrada regentrada,CuentaPagar cuentapagar);
    public void anularIngreso(Integer idregentrada);    
    public RegistroEntrada buscarPorIdalmacenPorIdregentrada(Integer idalmacen,Integer idregentrada);
    
    public List<DetalleIngreso> listaDetalleIngreso(Integer idregentrada);    
    public List<RegistroEntrada> listaPorFechas(Integer idalmacen,Date dfecha1,Date dfecha2);
    public List<RegistroEntrada> listaPorIdalmacenPorIdproveedorPorNano(Integer idalmacen,Integer idproveedor,Integer nano);
}
