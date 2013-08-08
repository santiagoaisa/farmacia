package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MapaDAO;
import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Rol;
import com.zarcillo.tipo.BarraMenu;
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
@Service("mapaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MapaServiceImpl implements MapaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private MapaDAO mapadao;

    @Override
    @Transactional
    public void registrar(Rol rol, Integer idmodulo) {
        try {
            //primero se elimina todo
            List<Mapa> lista = mapadao.listaPorIdrolPorIdmodulo(rol.getIdrol(), idmodulo);
            for (Mapa m : lista) {
                cruddao.eliminar(m);
            }
            //luego se actualiza o registra segun 
            List<Mapa> listaMapa = rol.getMapaCollection();
            for (Mapa m : listaMapa) {
                m.setIdrol(rol);
                if (m.getIdmapa() == null) {
                    cruddao.registrar(m);
                } else {
                    cruddao.actualizar(m);
                }
            }

        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }

    }

    @Override
   
    public List<Mapa> listaPorIdrolPorIdmoduloMenuArchivo(Integer idrol, Integer idmodulo) {
        return mapadao.listaPorIdrolPorIdmoduloPorNnivel(idrol, idmodulo, BarraMenu.ARCHIVOS.getNnivel());
    }

    @Override
   
    public List<Mapa> listaPorIdrolPorIdmoduloMenuProceso(Integer idrol, Integer idmodulo) {
        return mapadao.listaPorIdrolPorIdmoduloPorNnivel(idrol, idmodulo, BarraMenu.PROCESOS.getNnivel());
    }

    @Override
   
    public List<Mapa> listaPorIdrolPorIdmoduloMenuConsulta(Integer idrol, Integer idmodulo) {
        return mapadao.listaPorIdrolPorIdmoduloPorNnivel(idrol, idmodulo, BarraMenu.CONSULTAS.getNnivel());
    }

    @Override
   
    public List<Mapa> listaPorIdrolPorIdmoduloMenuHerramienta(Integer idrol, Integer idmodulo) {
        return mapadao.listaPorIdrolPorIdmoduloPorNnivel(idrol, idmodulo, BarraMenu.HERRAMIENTAS.getNnivel());
    }

    @Override
   
    public List<Mapa> listaEncabezado(Integer idrol, Integer idmodulo) {
        return mapadao.listaEncabezado(idrol, idmodulo);
    }

    @Override
   
    public List<Mapa> listaMenu(Integer idrol, Mapa mapa) {
        return mapadao.listaMenu(idrol, mapa);
    }

    @Override
   
    public List<Mapa> listaSubmenu(Integer idrol, Mapa mapa) {
        return mapadao.listaSubmenu(idrol, mapa);
    }
    
    
    
    
}
