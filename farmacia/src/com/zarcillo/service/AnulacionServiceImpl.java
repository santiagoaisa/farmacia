package com.zarcillo.service;

import com.zarcillo.dao.AnulacionDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.RegistroSalidaDAO;
import com.zarcillo.domain.Anulacion;
import com.zarcillo.domain.MotivoAnulacion;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.negocio.Entrada;
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
@Service("anulacionService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AnulacionServiceImpl extends Entrada implements AnulacionService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private RegistroSalidaDAO registrosalidadao;
    @Autowired
    private AnulacionDAO anulaciondao;

    @Override
    @Transactional
    public void anular(Integer idregsalida, MotivoAnulacion motivo, Usuario usuario) {
        try {

            RegistroSalida regsalida = registrosalidadao.buscarPorIdregsalida(idregsalida);
            super.anular(regsalida, motivo, usuario);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    public List<Anulacion> listaPorFechas(Date dfecha1, Date dfecha2) {
        return anulaciondao.listaPorFechas(dfecha1, dfecha2);
    }
}
