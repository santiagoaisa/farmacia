package com.zarcillo.service;

import com.zarcillo.domain.Vendedor;
import java.util.List;
/**
 *
 * @author saisa
 */
public interface VendedorService {
    public Vendedor registrar(Vendedor vendedor);
    public Vendedor actualizar(Vendedor vendedor);
    public void eliminar(Vendedor vendedor);
    public Vendedor buscar(Integer idvendedor);
    public List<Vendedor> listaGeneral();    
}
