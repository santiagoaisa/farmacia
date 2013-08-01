package com.zarcillo.service;

import com.zarcillo.dao.ChequeClienteDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.domain.ChequeCliente;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogChequeCliente;
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
@Service("chequeClienteService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChequeClienteServiceImpl implements ChequeClienteService{
    
     @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ChequeClienteDAO chequeclientedao;

    @Override
     @Transactional
    public ChequeCliente registrar(ChequeCliente cheque) {
         try {
            cheque.setDfecreg(new Date());
            cruddao.registrar(cheque);
            ////LOG
            registrarLog(MotivoLog.REGISTRO.toString(), cheque);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Cheque");
        }
        return cheque;
    }

    @Override
     @Transactional
    public ChequeCliente actualizar(ChequeCliente cheque) {
         try {
            cruddao.actualizar(cheque);
            ////LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), cheque);
            ////LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Cheque");
        }
        return cheque;
    }

    @Override
     @Transactional
    public void eliminar(ChequeCliente cheque) {
         try {
            cruddao.eliminar(cheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Cheque");
        }
    }

    @Override
    public ChequeCliente buscar(Integer idcheque) {
         try {
            return chequeclientedao.busqueda(idcheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un cheque con id:" + idcheque);
        }
    }

    @Override
     @Transactional(readOnly = true)
    public List<ChequeCliente> listaPorIdcliente(Integer idcliente) {
        return chequeclientedao.listaPorIdcliente(idcliente);
    }
    
     private void registrarLog(String cmotivo, ChequeCliente cheque) {
         LogChequeCliente logcheque = new LogChequeCliente();
        logcheque.setCmotivo(cmotivo);
        logcheque.setCobservacion(LogZarcillo.log(cheque));
        logcheque.setIdcheque(cheque);
        logcheque.setIdusuario(cheque.getIdusuario());
        logcheque.setDfecreg(new Date());
        cruddao.registrar(logcheque);
    }
    
}
