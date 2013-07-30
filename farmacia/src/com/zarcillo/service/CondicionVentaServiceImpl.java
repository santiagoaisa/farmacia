package com.zarcillo.service;

import com.zarcillo.dao.CondicionVentaDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogCondicionVenta;
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
@Service("condicionVentaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CondicionVentaServiceImpl implements CondicionVentaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private CondicionVentaDAO condicionventadao;

    @Override
    public CondicionVenta registrar(CondicionVenta condicion) {
        try {
            condicion.setDfecreg(new Date());
            cruddao.registrar(condicion);
             //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), condicion);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Condicion de Venta");
        }
        return condicion;
    }

    @Override
    public CondicionVenta actualizar(CondicionVenta condicion) {
        try {
            cruddao.actualizar(condicion);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), condicion);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar una Condicion de Venta");
        }
        return condicion;
    }

    @Override
    public void eliminar(CondicionVenta condicion) {
        try {
            cruddao.eliminar(condicion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar una Condicion de Venta");
        }
    }

    @Override
    public CondicionVenta buscar(Integer idcondicion) {
        try {
            return condicionventadao.busqueda(idcondicion);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite la Condicion de Venta con id:" + idcondicion);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<CondicionVenta> listaGeneral() {
        return cruddao.listarTodos(CondicionVenta.class);
    }
    
    private void registrarLog(String cmotivo, CondicionVenta condicion) {
        LogCondicionVenta logcondicion = new LogCondicionVenta();
        logcondicion.setCmotivo(cmotivo);
        logcondicion.setCobservacion(LogZarcillo.log(condicion));
        logcondicion.setIdcondicion(condicion);
        logcondicion.setIdusuario(condicion.getIdusuario());
        logcondicion.setDfecreg(new Date());
        cruddao.registrar(logcondicion);
    }
    
}
