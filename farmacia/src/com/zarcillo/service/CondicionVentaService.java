package com.zarcillo.service;

import com.zarcillo.domain.CondicionVenta;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface CondicionVentaService {
    
     public CondicionVenta registrar(CondicionVenta condicion);
    public CondicionVenta actualizar(CondicionVenta condicion);
    public void eliminar(CondicionVenta condicion);
    public CondicionVenta buscar(Integer idcondicion);
    public List<CondicionVenta> listaGeneral();
    
}
