package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.ProveedorDAO;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogProveedor;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("proveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProveedorServiceImpl implements ProveedorService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ProveedorDAO proveedordao;

    @Override
    @Transactional
    public Proveedor registrar(Proveedor proveedor) {
        try {
            proveedor.setDfecreg(new Date());
            cruddao.registrar(proveedor);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), proveedor);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Proveedor");
        }
        return proveedor;
    }

    @Override
    @Transactional
    public Proveedor actualizar(Proveedor proveedor) {
        try {
            cruddao.actualizar(proveedor);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), proveedor);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Proveedor");
        }
        return proveedor;
    }

    @Override
    @Transactional
    public void eliminar(Proveedor proveedor) {
        try {
            cruddao.eliminar(proveedor);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar el Proveedor");
        }
    }

    @Override
    public Proveedor buscar(Integer idproveedor) {
        try {
            return proveedordao.busqueda(idproveedor);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el proveedor con id:" + idproveedor);
        }
    }

    @Override
    public List<Proveedor> listaGeneral() {
        return cruddao.listarTodos(Proveedor.class);
    }

    @Override
    public List<Proveedor> busquedaListaPorCnomprovee(String ccriterio) {
        return proveedordao.busquedaListaPorCnomprovee(ccriterio);
    }

    private void registrarLog(String cmotivo, Proveedor proveedor) {
        LogProveedor logproveedor = new LogProveedor();
        logproveedor.setCmotivo(cmotivo);
        logproveedor.setCobservacion(LogZarcillo.log(proveedor));
        logproveedor.setIdproveedor(proveedor);
        logproveedor.setIdusuario(proveedor.getIdusuario());
        logproveedor.setDfecreg(new Date());
        cruddao.registrar(logproveedor);
    }
}
