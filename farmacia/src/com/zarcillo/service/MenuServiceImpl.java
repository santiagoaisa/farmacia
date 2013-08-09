package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MenuDAO;
import com.zarcillo.domain.Menu;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogMenu;
import com.zarcillo.tipo.BarraMenu;
import java.util.ArrayList;
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
@Service("menuService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MenuServiceImpl implements MenuService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MenuDAO menudao;

    @Override
    @Transactional
    public Menu registrar(Menu menu) {
        try {
            menu.setDfecreg(new Date());
            cruddao.registrar(menu);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), menu);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Menu");
        }
        return menu;
    }

    @Override
    @Transactional
    public Menu actualizar(Menu menu) {
        try {
            cruddao.actualizar(menu);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), menu);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Menu");
        }
        return menu;
    }

    @Override
    @Transactional
    public void eliminar(Menu menu) {
        try {
            cruddao.eliminar(menu);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Menu");
        }
    }

    @Override
    public Menu buscar(Integer idmenu) {
        try {
            return menudao.busqueda(idmenu);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el modulo con id:" + idmenu);
        }
    }

    @Override
    public List<BarraMenu> listaBarraMenu() {
        List<BarraMenu> listaRetorno = new ArrayList<BarraMenu>();
        listaRetorno.add(BarraMenu.ARCHIVOS);
        listaRetorno.add(BarraMenu.CONSULTAS);
        listaRetorno.add(BarraMenu.HERRAMIENTAS);
        listaRetorno.add(BarraMenu.PROCESOS);
        return listaRetorno;
    }

    @Override   
    public List<Menu> listaPorIdmoduloMenuArchivo(Integer idmodulo) {
        return menudao.listaPorIdmoduloPorNnivel1(idmodulo, BarraMenu.ARCHIVOS.getNnivel());
    }

    @Override   
    public List<Menu> listaPorIdmoduloMenuProceso(Integer idmodulo) {
        return menudao.listaPorIdmoduloPorNnivel1(idmodulo, BarraMenu.PROCESOS.getNnivel());
    }

    @Override   
    public List<Menu> listaPorIdmoduloMenuConsulta(Integer idmodulo) {
        return menudao.listaPorIdmoduloPorNnivel1(idmodulo, BarraMenu.CONSULTAS.getNnivel());
    }

    @Override   
    public List<Menu> listaPorIdmoduloMenuHerramienta(Integer idmodulo) {
        return menudao.listaPorIdmoduloPorNnivel1(idmodulo, BarraMenu.HERRAMIENTAS.getNnivel());
    }

    private void registrarLog(String cmotivo, Menu menu) {
        LogMenu logmenu = new LogMenu();
        logmenu.setCmotivo(cmotivo);
        logmenu.setCobservacion(LogZarcillo.log(menu));
        logmenu.setIdmenu(menu);
        logmenu.setIdusuario(menu.getIdusuario());
        logmenu.setDfecreg(new Date());
        cruddao.registrar(logmenu);
    }
}
