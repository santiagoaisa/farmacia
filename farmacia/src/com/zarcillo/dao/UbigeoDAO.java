package com.zarcillo.dao;

import com.zarcillo.domain.Ubigeo;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface UbigeoDAO {
    
    List<Ubigeo> listaGeneralDepartamento();
    List<Ubigeo> listaGeneralProvincia();
    List<Ubigeo> listaProvincia(String departamento);
    List<Ubigeo> listaDistrito(String departamento,String provincia);
    Ubigeo buscarPorIdubigeo(String idubigeo);
    Ubigeo buscarDepartamento(String departamento);
    Ubigeo buscarProvincia(String departamento,String provincia);
    
}
