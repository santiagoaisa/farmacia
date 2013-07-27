package com.zarcillo.service;

import com.zarcillo.dao.CondicionVentaDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.CondicionVenta;
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
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Condicion de Venta");
        }
        return condicion;
    }

    @Override
    public CondicionVenta actualizar(CondicionVenta condicion) {
        try {
            cruddao.actualizar(condicion);
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
}
