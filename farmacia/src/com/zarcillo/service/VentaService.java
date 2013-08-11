package com.zarcillo.service;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.dto.venta.DetalleVenta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface VentaService {
    
    public List<DetalleVenta> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen,String criterio);
    public DetalleVenta detalleVenta(Integer idalmacen, Existencia existencia,Usuario idusuario);
    public Integer registrar(RegistroSalida regsalida,Almacen almacen);
    public List<Documento> listaDocumento(Integer idcliente);
    public List<CondicionVenta> listaCondicion();    
    public List<MotivoSalida> listaMotivo();  
    public List<Vendedor> listaVendedorActivo();
    
}
