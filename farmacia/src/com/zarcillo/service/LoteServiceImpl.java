package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.domain.Lote;
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
@Service("loteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class LoteServiceImpl implements LoteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private LoteDAO lotedao;

    @Override
    @Transactional
    public Lote registrar(Lote lote) {
        try {
            lote.setDfecreg(new Date());
            cruddao.registrar(lote);

        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Lote");
        }
        return lote;
    }

    @Override
    @Transactional
    public Lote actualizar(Lote lote) {
        try {
            cruddao.actualizar(lote);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Lote");
        }
        return lote;
    }

    @Override
    @Transactional
    public void eliminar(Lote lote) {
        try {
            cruddao.eliminar(lote);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Lote");
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Lote> listaPorIdalmacenPorIdproducto(Integer idalmacen, String idproducto) {
        return lotedao.listaPorIdalmacenPorIdproductoParaListado(idalmacen, idproducto);
    }
}
