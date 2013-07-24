package com.zarcillo.service;

import com.zarcillo.dao.RolDAO;
import com.zarcillo.domain.Rol;
import java.math.BigDecimal;
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

    @Transactional
    public void registrar(Rol rol) {
        roldao.registrar(rol);        
    }

    public List<Rol> listaRoles() {
        return roldao.lista();
    }
}
