package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.UbigeoDAO;
import com.zarcillo.domain.Ubigeo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

/**
 *
 * @author saisa
 */
@Service("ubigeoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UbigeoServiceImpl implements UbigeoService{
    
    
    @Autowired
    private UbigeoDAO ubigeodao;

    @Override
    public List<Ubigeo> listaDepartamento() {
         return ubigeodao.listaGeneralDepartamento();
    }

    @Override
    public List<Ubigeo> listaProvincia() {
        return ubigeodao.listaGeneralProvincia();
    }

    @Override
    public List<Ubigeo> listaProvincia(String departamento) {
        return ubigeodao.listaProvincia(departamento);
    }

    @Override
    public List<Ubigeo> listaDistrito(String departamento, String provincia) {
        return ubigeodao.listaDistrito(departamento, provincia);
    }

    @Override
    public Ubigeo buscarDepartamento(String departamento) {
        return ubigeodao.buscarDepartamento(departamento);
    }

    @Override
    public Ubigeo buscarProvincia(String departamento, String provincia) {
        return ubigeodao.buscarProvincia(departamento, provincia);
    }
    
}
