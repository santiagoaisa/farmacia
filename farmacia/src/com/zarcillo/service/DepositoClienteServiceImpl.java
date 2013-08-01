package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DepositoClienteDAO;
import com.zarcillo.domain.ChequeCliente;
import com.zarcillo.domain.DepositoCliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogChequeCliente;
import com.zarcillo.log.LogDepositoCliente;
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
@Service("depositoClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DepositoClienteServiceImpl implements DepositoClienteService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private DepositoClienteDAO depositoclientedao;

    @Override
    @Transactional
    public DepositoCliente registrar(DepositoCliente deposito) {
        try {
            deposito.setDfecreg(new Date());
            cruddao.registrar(deposito);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), deposito);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Deposito");
        }
        return deposito;
    }

    @Override
    @Transactional
    public DepositoCliente actualizar(DepositoCliente deposito) {
        try {
            cruddao.actualizar(deposito);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), deposito);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Deposito");
        }
        return deposito;
    }

    @Override
    @Transactional
    public void eliminar(DepositoCliente deposito) {
        try {
            cruddao.eliminar(deposito);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Deposito");
        }
    }

    @Override
    public DepositoCliente buscar(Integer iddeposito) {
        try {
            return depositoclientedao.busqueda(iddeposito);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un deposito con id:" + iddeposito);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<DepositoCliente> listaPorIdcliente(Integer idcliente) {
        return depositoclientedao.listaPorIdcliente(idcliente);
    }

    private void registrarLog(String cmotivo, DepositoCliente deposito) {
        LogDepositoCliente logdeposito = new LogDepositoCliente();
        logdeposito.setCmotivo(cmotivo);
        logdeposito.setCobservacion(LogZarcillo.log(deposito));
        logdeposito.setIddeposito(deposito);
        logdeposito.setIdusuario(deposito.getIdusuario());
        logdeposito.setDfecreg(new Date());
        cruddao.registrar(logdeposito);
    }
}
