package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.EmpresaDAO;
import com.zarcillo.domain.Empresa;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("empresaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class EmpresaServiceImpl implements EmpresaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private EmpresaDAO empresadao;

    @Override
    @Transactional
    public Empresa registrar(Empresa empresa) {
        try {
            empresa.setDfecreg(new Date());
            cruddao.registrar(empresa);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Empresa");
        }
        return empresa;
    }

    @Override
    @Transactional
    public Empresa actualizar(Empresa empresa) {
        try {
            cruddao.actualizar(empresa);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Empresa");
        }
        return empresa;
    }

    @Override
    @Transactional
    public void eliminar(Empresa empresa) {
        try {
            cruddao.eliminar(empresa);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Empresa");
        }
    }

    @Override
    public Empresa buscar(Integer idempresa) {
        try {         
            return empresadao.busqueda(idempresa);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la empresa con id:"+idempresa);
        }
    }

    @Override
     @Transactional(readOnly = true)
    public List<Empresa> listaGeneral() {
        return cruddao.listarTodos(Empresa.class);
    }
}
