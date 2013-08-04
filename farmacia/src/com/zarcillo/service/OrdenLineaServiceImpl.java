package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LineaDAO;
import com.zarcillo.dao.OrdenLineaDAO;
import com.zarcillo.domain.Linea;
import com.zarcillo.domain.OrdenLinea;
import java.util.ArrayList;
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
@Service("ordenLineaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class OrdenLineaServiceImpl implements OrdenLineaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private OrdenLineaDAO ordenlineadao;
    @Autowired
    private LineaDAO lineadao;

    @Override
    @Transactional
    public void registrar(Integer idunidad, List<OrdenLinea> lista) {
        try {
            List<OrdenLinea> listaOrden = ordenlineadao.listaPorIdunidad(idunidad);
            for (OrdenLinea ol : listaOrden) {
                if (ol.getIdorden() != null) {
                    cruddao.actualizar(ol);
                } else {
                    cruddao.registrar(ol);
                }
            }
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    public List<Linea> listaPorIdunidadOrdenada(Integer idunidad) {
        List<OrdenLinea> listaOrden = ordenlineadao.listaPorIdunidad(idunidad);
        List<Linea> listaLinea = new ArrayList<Linea>();

        Linea l;
        for (OrdenLinea ol : listaOrden) {
            l = ol.getIdlinea();
            listaLinea.add(l);
        }
        return listaLinea;
    }

    @Override
    public List<Linea> listaPorIdunidadPendiente(Integer idunidad) {
        List<OrdenLinea> listaOrden = ordenlineadao.listaPorIdunidad(idunidad);
        List<Linea> listaLinea = new ArrayList<Linea>();

        Linea l;
        for (OrdenLinea ol : listaOrden) {
            l = ol.getIdlinea();
            listaLinea.add(l);
        }

        List<Linea> listaOriginal = lineadao.listaActivos();
        listaOriginal.removeAll(listaLinea);
        return listaOriginal;
    }
}
