package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.RolDAO;
import com.zarcillo.domain.Rol;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("rolService")
@Scope(value="singleton",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class RolServiceImpl implements RolService {

    @Autowired
    private RolDAO roldao;
    @Autowired
    private CrudDAO cruddao;

    @Override
    @Transactional       
    public void registrar(Rol rol) {
        rol.setDfecreg(new Date());
        cruddao.registrar(rol);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Rol> listaRoles() {
        return cruddao.listarTodos(Rol.class);
    }
}
