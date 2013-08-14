package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.dto.numeracion.Formato;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("numeracionService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class NumeracionServiceImpl implements NumeracionService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private NumeracionDAO numeraciondao;

    @Override
    @Transactional
    public Formato buscarPorIdunidadPorIddocumento(Integer idunidad, Integer iddocumento) {
        try {

            Numeracion numeracion = numeraciondao.buscarPorIdunidadPorIddocumento(idunidad, iddocumento);
            Documento documento = numeracion.getIddocumento();
            documento.setNitems(numeracion.getNitems());
            Formato formato = new Formato();
            formato.setId(numeracion.getIdnumeracion());
            ///
            formato.setCserie(numeracion.getCserie());
            formato.setNnumero(numeracion.getNnumero());
            ///
            formato.setCimagen(numeracion.getCimagen());
            formato.setCreporte(numeracion.getCreporte());
            formato.setIddocumento(documento);
            return formato;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo("El Documento no Existe");
        }
    }

    @Override
    @Transactional
    public Formato buscarPorIdunidadPorIddocumentoPorCserie(Integer idunidad, Integer iddocumento, Integer cserie) {
        try {

            Numeracion numeracion = numeraciondao.buscarPorIddocumentoPorCserie(idunidad, iddocumento, cserie);

            Documento documento = numeracion.getIddocumento();
            documento.setNitems(numeracion.getNitems());

            Formato formato = new Formato();
            formato.setCimagen(numeracion.getCimagen());
            formato.setCreporte(numeracion.getCreporte());
            formato.setCserie(numeracion.getCserie());
            formato.setIddocumento(documento);
            return formato;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    @Transactional
    public Formato actualizar(Formato formato) {
        try {

            Numeracion numeracion = numeraciondao.buscarPorIdnumeracion(formato.getId());
            numeracion.setNnumero(formato.getNnumero());
            cruddao.actualizar(numeracion);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return formato;
    }
}
