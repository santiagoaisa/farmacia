package com.zarcillo.service;

import com.zarcillo.domain.Almacen;
import java.util.List;
import org.hibernate.StatelessSession;

/**
 *
 * @author saisa
 */

public interface AlmacenService {
    
      public Almacen registrar(Almacen almacen);
    public Almacen actualizar(Almacen almacen);
    public void eliminar(Almacen almacen);
    public Almacen buscar(Integer idalmacen);
    public List<Almacen> listaGeneral();
    public List<Almacen> listaPorClogin(String clogin);
    
}
