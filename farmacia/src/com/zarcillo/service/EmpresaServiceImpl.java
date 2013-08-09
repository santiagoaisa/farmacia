package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.EmpresaDAO;
import com.zarcillo.domain.Empresa;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogEmpresa;
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
             ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), empresa);
            ////LOG


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
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), empresa);
            ////LOG
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
            throw new ExceptionZarcillo("No exite la empresa con id:" + idempresa);
        }
    }

    @Override
   
    public List<Empresa> listaGeneral() {
        return empresadao.listaGeneral();
    }

    private void registrarLog(String cmotivo,Empresa empresa) {
        ////LOG
        LogEmpresa logempresa = new LogEmpresa();
        logempresa.setCmotivo(cmotivo);
        logempresa.setCobservacion(LogZarcillo.log(empresa));
        logempresa.setIdempresa(empresa);
        logempresa.setIdusuario(empresa.getIdusuario());
        logempresa.setDfecreg(new Date());
        cruddao.registrar(logempresa);
        ////LOG
    }
}
