package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.KardexDAO;
import com.zarcillo.domain.Existencia;
import com.zarcillo.dto.almacen.Kardex;
import com.zarcillo.dto.almacen.TotalKardex;
import com.zarcillo.util.OrdenarPorIdmovimiento;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
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
@Service("kardexService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class KardexServiceImpl implements KardexService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private KardexDAO kardexdao;
    @Autowired
    private ExistenciaDAO existenciadao;

    @Override
    @Transactional
    public List<Kardex> listaKardex(Integer idalmacen, String idproducto, Integer idperiodo) {
        Integer nro = 0;
        Integer nsaldo = 0;
        Integer nentrada = 0;
        Integer nsalida = 0;

        List<Kardex> lista = new ArrayList<>();

        List<Kardex> listaEntrada = kardexdao.listaEntradaPorIdalmacenPorIdproductoPorIdperiodo(idalmacen, idproducto, idperiodo);
        List<Kardex> listaSalida = kardexdao.listaSalidaPorIdalmacenPorIdproductoPorIdperiodo(idalmacen, idproducto, idperiodo);

        lista.addAll(listaEntrada);
        lista.addAll(listaSalida);
        Collections.sort(lista, new OrdenarPorIdmovimiento());

        List<Kardex> listaKardex = new ArrayList<Kardex>();

        if (lista.isEmpty()) {
            Kardex kardex = new Kardex();
            kardex.setNnro(1);
            kardex.setCtipmov("");
            kardex.setDfecmov(new Date());
            kardex.setCfactura("------");
            kardex.setCguia("------");
            kardex.setCnombre("SIN MOVIMIENTO");
            listaKardex.add(kardex);
        }

        Kardex k;
        for (Kardex m : lista) {
            nro = nro + 1;
            k = new Kardex();
            k.setNnro(nro);
            k.setId(m.getId());
            k.setNoperacion(m.getNoperacion());
            k.setNcosuni(m.getNcosuni());
            k.setCabrev(m.getCabrev());
            k.setCserfac(m.getCserfac());
            k.setCsergui(m.getCsergui());
            k.setCfactura(m.getCfactura());
            k.setDfecmov(m.getDfecmov());
            k.setCguia(m.getCguia());
            k.setCnombre(m.getCnombre());
            k.setCtipmov(m.getCtipmov());
            k.setCfecven(m.getCfecven());
            k.setClote(m.getClote());
            k.setNdia(m.getNdia());
            k.setNcompra(m.getNcompra());
            k.setNventa(m.getNventa());
            k.setNsaldo(m.getNsaldo());
            k.setNregentrada(m.getNregentrada());
            k.setNregsalida(m.getNregsalida());
            k.setNimporteentrada(m.getNimporteentrada());
            k.setNimportesalida(m.getNimportesalida());
            k.setNdesfin(m.getNdesfin());
            k.setNdesbon(m.getNdesbon());
            k.setNdeslab(m.getNdeslab());
            k.setBanulado(m.isBanulado());
            k.setCnomdistrito(m.getCnomdistrito());
            k.setCnomprovincia(m.getCnomprovincia());
            k.setCnomdepartamento(m.getCnomdepartamento());

            if (k.getCtipmov().contains("E")) {
                nsaldo = nsaldo + k.getNcompra();
                k.setNsaldo(nsaldo);

//                if (m.getIdcodigo().contains(Proveedor.DEVOLUCION.getIdproveedor())) {
//                    k.setBdevuelto(true);
//                }

                nentrada = nentrada + k.getNcompra();

            } else if (k.getCtipmov().contains("S")) {
                if (k.getCfactura() == null) {
                    // si no tiene numero de factura
                    if (k.getCguia() == null) {
                        continue;
                    }

                } else {
                    if (k.getCfactura().isEmpty() && k.getCguia().isEmpty()) {
                        continue;
                    }
                }


                nsaldo = nsaldo - k.getNventa();
                k.setNsaldo(nsaldo);
                nsalida = nsalida + k.getNventa();
            } else {
                k.setCfactura("NC/" + k.getCfactura().trim());
                k.setNsaldo(nsaldo);
            }

            k.setNimportesaldo(k.getNcosuni().multiply(new BigDecimal(k.getNsaldo())));
            listaKardex.add(k);
        }//fin for


        return listaKardex;
    }

    @Override
    @Transactional
    public TotalKardex busquedaKardex(Integer idalmacen, String idproducto, Integer idperiodo) {
        TotalKardex tk = new TotalKardex();
        Existencia e = existenciadao.buscarPorIdalmacenPorIdproducto(idalmacen, idproducto);
        tk.setNstock(e.getNstock());
        return tk;
    }
}