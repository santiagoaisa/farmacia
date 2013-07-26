package com.zarcillo.service;

import com.zarcillo.domain.Empresa;
import java.util.List;

public interface EmpresaService {

    public Empresa registrar(Empresa empresa);
    public Empresa actualizar(Empresa empresa);
    public void eliminar(Empresa empresa);
    public Empresa buscar(Integer idempresa);
    public List<Empresa> listaGeneral();
}
