package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.ListadoExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Periodo;
import com.zarcillo.dto.almacen.Inventario;
import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.dto.almacen.InventarioValorizado;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

/**
 *
 * @author saisa
 */
@Service("listadoExistenciaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ListadoExistenciaServiceImpl implements ListadoExistenciaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ExistenciaDAO existenciadao;
    @Autowired
    private ListadoExistenciaDAO listadoexistenciadao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private LoteDAO lotedao;

    @Override
    public List<Inventario> listaInventarioPorIdalmacenPorLineas(Integer idalmacen, List<Integer> lista) {
        List<Existencia> listaExistencia = existenciadao.listaPorIdalmacenPorLineasConStock(idalmacen, lista);
        List<Inventario> listaInventario = new ArrayList<>();

        Inventario inventario;
        for (Existencia e : listaExistencia) {
            inventario = new Inventario();
            inventario.setIdproducto(e.getIdproducto());
            inventario.setCubicacion(e.getCubicacion());
            inventario.setNstock(e.getNstock());
            inventario.setNstockm(e.getNstockm());
            listaInventario.add(inventario);
        }
        return listaInventario;
    }

    @Override
    public List<InventarioLote> listaInventarioLotePorIdalmacenPorLineas(Integer idalmacen, List<Integer> lista) {
        return listadoexistenciadao.listaPorIdalmacenPorLineasConStock(idalmacen, lista);
    }

    @Override
    public List<InventarioValorizado> listaInventarioValorizadoPorIdalmacen(Integer idalmacen) {
        Periodo periodo = periododao.buscarPorFecha(new Date());
        List<InventarioValorizado> listaInventario = listadoexistenciadao.listaPorIdalmacenConStock(idalmacen);
        List<InventarioValorizado> listaRetorno = new ArrayList<>();

        BigDecimal ntotal = new BigDecimal("0");
        InventarioValorizado inventario;
        for (InventarioValorizado i : listaInventario) {
            inventario = new InventarioValorizado();
            inventario.setIdlinea(i.getIdlinea());
            inventario.setNcosto(i.getNcosto());
            inventario.setPcosto(Igv.Importe(periodo.getNigv(), i.getNcosto()));
            listaRetorno.add(inventario);
            ntotal = ntotal.add(i.getNcosto());
        }

        BigDecimal nparticipacion;
        for (InventarioValorizado i : listaRetorno) {
            if (Numero.isCero(i.getNcosto())) {
                nparticipacion = i.getPcosto().divide(ntotal, 4, BigDecimal.ROUND_HALF_UP);
            } else {
                nparticipacion = Numero.cero;
            }
            nparticipacion = nparticipacion.multiply(Numero.cien);
            i.setNporcentaje(nparticipacion);
        }

        return listaRetorno;

    }
}
