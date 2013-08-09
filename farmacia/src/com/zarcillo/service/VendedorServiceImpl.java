package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.VendedorDAO;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogVendedor;
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
@Service("vendedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class VendedorServiceImpl implements VendedorService {

    @Autowired
    private VendedorDAO vendedordao;
    @Autowired
    private CrudDAO cruddao;

    @Override
    @Transactional
    public Vendedor registrar(Vendedor vendedor) {
        try {
            vendedor.setDfecreg(new Date());
            cruddao.registrar(vendedor);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), vendedor);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Vendedor");
        }
        return vendedor;
    }

    @Override
    @Transactional
    public Vendedor actualizar(Vendedor vendedor) {
        try {
            cruddao.actualizar(vendedor);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), vendedor);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Vendedor");
        }
        return vendedor;
    }

    @Override
    @Transactional
    public void eliminar(Vendedor vendedor) {
        try {
            cruddao.eliminar(vendedor);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Vendedor");
        }
    }

    @Override
    public Vendedor buscar(Integer idvendedor) {
        try {
            return vendedordao.busqueda(idvendedor);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite al vendedor con id:" + idvendedor);
        }
    }

    @Override
   
    public List<Vendedor> listaGeneral() {
        return vendedordao.listaGeneral();
    }

    private void registrarLog(String cmotivo, Vendedor vendedor) {
        LogVendedor logvendedor = new LogVendedor();
        logvendedor.setCmotivo(cmotivo);
        logvendedor.setCobservacion(LogZarcillo.log(vendedor));
        logvendedor.setIdvendedor(vendedor);
        logvendedor.setDfecreg(new Date());
        cruddao.registrar(logvendedor);
    }
}
