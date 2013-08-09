package com.zarcillo.dao;

import com.zarcillo.domain.Empresa;
import java.util.List;

public interface EmpresaDAO {
    Empresa busqueda(Integer idempresa);
    List<Empresa> listaGeneral();
}
