package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.ProductoDAO;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogPeriodo;
import com.zarcillo.log.LogProducto;
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
@Service("productoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ProductoDAO productodao;

    @Override
    @Transactional
    public Producto registrar(Producto producto) {
        try {
            producto.setDfecreg(new Date());
            cruddao.registrar(producto);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), producto);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear una Producto");
        }
        return producto;
    }

    @Override
    @Transactional
    public Producto actualizar(Producto producto) {
        try {
            cruddao.actualizar(producto);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), producto);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Producto");
        }
        return producto;
    }

    @Override
    @Transactional
    public void eliminar(Producto producto) {
        try {
            cruddao.eliminar(producto);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Producto");
        }
    }

    @Override
    public Producto buscar(String idproducto) {
        try {
            return productodao.busqueda(idproducto);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el producto con id:" + idproducto);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Producto> listaGeneral() {
        return cruddao.listarTodos(Producto.class);
    }

    private void registrarLog(String cmotivo, Producto producto) {
        LogProducto logproducto = new LogProducto();
        logproducto.setCmotivo(cmotivo);
        logproducto.setCobservacion(LogZarcillo.log(producto));
        logproducto.setIdproducto(producto);
        logproducto.setIdusuario(producto.getIdusuario());
        logproducto.setDfecreg(new Date());
        cruddao.registrar(logproducto);
    }
}
