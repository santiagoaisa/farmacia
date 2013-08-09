package com.zarcillo.dao;

import com.zarcillo.domain.Vendedor;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface VendedorDAO {
    Vendedor busqueda(Integer idvendedor);
    List<Vendedor> listaPorBactivo();
    List<Vendedor> listaGeneral();
    
}
