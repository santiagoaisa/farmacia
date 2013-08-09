package com.zarcillo.service;

import com.zarcillo.dao.BancoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.Banco;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogBanco;
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
@Service("bancoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BancoServiceImpl implements BancoService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private BancoDAO bancodao;

    @Override
    @Transactional
    public Banco registrar(Banco banco) {
        try {
            banco.setDfecreg(new Date());
            cruddao.registrar(banco);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), banco);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Banco");
        }
        return banco;
    }

    @Override
    @Transactional
    public Banco actualizar(Banco banco) {
        try {
            cruddao.actualizar(banco);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), banco);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Banco");
        }
        return banco;
    }

    @Override
    @Transactional
    public void eliminar(Banco banco) {
        try {
            cruddao.eliminar(banco);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Banco");
        }
    }

    @Override
    public Banco buscar(Integer idbanco) {
        try {
            return bancodao.busqueda(idbanco);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el banco con id:" + idbanco);
        }
    }

    @Override
   
    public List<Banco> listaGeneral() {
        return bancodao.listaGeneral();
    }

    private void registrarLog(String cmotivo, Banco banco) {
        LogBanco logbanco = new LogBanco();
        logbanco.setCmotivo(cmotivo);
        logbanco.setCobservacion(LogZarcillo.log(banco));
        logbanco.setIdbanco(banco);
        logbanco.setIdusuario(banco.getIdusuario());
        logbanco.setDfecreg(new Date());
        cruddao.registrar(logbanco);
    }
}
