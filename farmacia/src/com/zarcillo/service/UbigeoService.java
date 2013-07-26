package com.zarcillo.service;

import com.zarcillo.domain.Ubigeo;
import java.util.List;

public interface UbigeoService {
    
    public List<Ubigeo> listaDepartamento();
    public List<Ubigeo> listaProvincia();
    public List<Ubigeo> listaProvincia(String departamento);
    public List<Ubigeo> listaDistrito(String departamento,String provincia);

    public Ubigeo buscarDepartamento(String departamento);
    public Ubigeo buscarProvincia(String departamento,String provincia);
    
}
