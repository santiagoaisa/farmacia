package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DescuentoDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Producto;
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
@Service("existenciaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ExistenciaServiceImpl implements ExistenciaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ExistenciaDAO existenciadao;
    @Autowired
    private DescuentoDAO descuentodao;
    @Autowired
    private LoteDAO lotedao;

    @Override
    @Transactional
    public Existencia registrar(Almacen idalmacen, Producto idproducto) {
        Existencia existencia = new Existencia(idalmacen.getIdalmacen(), idproducto.getIdproducto());
        try {
            existencia.setDfecreg(new Date());
            cruddao.registrar(existencia);
        } catch (Exception e) {
            if (e.getCause().getMessage().contains("ConstraintViolationException")) {
                throw new ExceptionZarcillo("La Existencia con codigo:" + idproducto.getIdproducto() + "-" + idproducto + "\n" + "YA EXISTE ! en el Almacen: " + idalmacen);
            }
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
        return existenciadao.buscarPorIdalmacenPorIdproducto(idalmacen.getIdalmacen(), idproducto.getIdproducto());
    }

    @Override
    @Transactional
    public Existencia actualizar(Existencia existencia) {
        try {
            cruddao.actualizar(existencia);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
        return existencia;
    }

    @Override
    @Transactional
    public Existencia actualizar(Existencia existencia, Descuento descuento) {
        Existencia eactualizada;
        Descuento dactualizado;
        try {
            eactualizada = existenciadao.buscarPorIdalmacenPorIdproducto(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());

            eactualizada.setBactivo(existencia.getBactivo());
            eactualizada.setNvalven(existencia.getNvalven());
            eactualizada.setNstock(existencia.getNstock());
            eactualizada.setNincremento(existencia.getNincremento());

            dactualizado = descuentodao.busquedaPorIdalmacenPorIdproducto(eactualizada.getIdalmacen().getIdalmacen(), eactualizada.getIdproducto().getIdproducto());
            dactualizado.setExistencia(eactualizada);

            dactualizado.setNbon1(descuento.getNbon1());
            dactualizado.setNbon2(descuento.getNbon2());

            dactualizado.setNcant1(descuento.getNcant1());
            dactualizado.setNdesc1(descuento.getNdesc1());

            dactualizado.setNcant2(descuento.getNcant2());
            dactualizado.setNdesc2(descuento.getNdesc2());

            dactualizado.setNcant3(descuento.getNcant3());
            dactualizado.setNdesc3(descuento.getNdesc3());

            dactualizado.setNcant4(descuento.getNcant4());
            dactualizado.setNdesc4(descuento.getNdesc4());

            if (descuento.getIddescuento() == null) {
                cruddao.registrar(dactualizado);
            } else {
                cruddao.actualizar(dactualizado);
            }
            cruddao.actualizar(eactualizada);
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
//            e.printStackTrace();
        }
        return existenciadao.buscarPorIdalmacenPorIdproducto(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
    }

    @Override
    @Transactional
    public Integer actualizaTemporal(Existencia existencia) {
        // tener mucho cuidado si se va a modificar
        try {
            Existencia existenciabuscada = existenciadao.buscarPorIdalmacenPorIdproducto(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
            if (existenciabuscada.getNtemporal() < 0) {
                existenciabuscada.setNtemporal(0);
            }
            //stock real - stock tempporal
            Integer lote_bloqueado = lotedao.cantidadBloqueadaPorIdalmacenPorIdproductoBloqueados(existencia.getIdalmacen().getIdalmacen(), existencia.getIdproducto().getIdproducto());
            Integer stockdisponible = existenciabuscada.getNstock() - lote_bloqueado - existenciabuscada.getNtemporal();

            Integer stockreal = existencia.getNstock() - lote_bloqueado;
            Integer stocktemporal = existenciabuscada.getNtemporal();

            existenciabuscada.setNtemporal(existenciabuscada.getNtemporal() + existencia.getNtemporal());

            if (existenciabuscada.getNtemporal() > stockreal) {
                existenciabuscada.setNtemporal(stocktemporal + stockdisponible);
                stockdisponible = stockdisponible - existencia.getNtemporal();
                cruddao.actualizar(existenciabuscada);
                //el stock disponible se sigue manteniendo
            } else {
                stockdisponible = stockreal - existenciabuscada.getNtemporal();
                cruddao.actualizar(existenciabuscada);
            }

            return stockdisponible;
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
    }

    @Override
    public Descuento buscarDescuentoPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto) {
        return descuentodao.busquedaPorIdalmacenPorIdproducto(idalmacen, idproducto);
    }

    @Override
    public Existencia buscarPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto) {
        try {
            return existenciadao.buscarPorIdalmacenPorIdproducto(idalmacen, idproducto);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe la Existencia :" + idproducto);
        }
    }

    @Override
    public List<Existencia> busquedaListaPorIdalmacenPorDescripcion(Integer idalmacen, String criterio) {
        return existenciadao.busquedaListaPorIdalmacenPorDescripcion(idalmacen, criterio);
    }

    @Override
    public List<Existencia> listaPorIdalmacenInafectos(Integer idalmacen) {
        return existenciadao.listaPorIdalmacenPorBinafecto(idalmacen);
    }

    @Override
    public List<Existencia> listaPorIdalmacenPorIdlinea(Integer idalmacen, Integer idlinea) {
        return existenciadao.listaPorIdalmacenPorIdlinea(idalmacen, idlinea);
    }
}
