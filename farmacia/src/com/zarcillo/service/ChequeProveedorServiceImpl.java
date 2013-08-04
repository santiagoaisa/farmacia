package com.zarcillo.service;

import com.zarcillo.dao.ChequeProveedorDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.ChequeProveedor;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogChequeProveedor;
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
@Service("chequeProveedorService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChequeProveedorServiceImpl implements ChequeProveedorService{
    
    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private ChequeProveedorDAO chequeproveedordao;
    @Autowired
    private PeriodoDAO periododao;

    @Override
    @Transactional
    public ChequeProveedor registrar(ChequeProveedor cheque) {
          try {
            cheque.setDfecreg(new Date());
             cheque.setIdperiodo(periododao.buscarPorFecha(cheque.getDfecha()));
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
    public ChequeProveedor actualizar(ChequeProveedor cheque) {
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
    public void eliminar(ChequeProveedor cheque) {
          try {
            cruddao.eliminar(cheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Cheque");
        }
    }

    @Override
    public ChequeProveedor buscar(Integer idcheque) {
         try {
            return chequeproveedordao.busqueda(idcheque);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite un cheque con id:" + idcheque);
        }
    }

    
    @Override
     @Transactional(readOnly = true)
    public List<ChequeProveedor> listaPorIdunidadPorIdproveedorPorNano(Integer idunidad, Integer idproveedor, Integer nano) {
        return chequeproveedordao.listaPorIdunidadPorIdproveedorPorNano(idunidad, idproveedor, nano);
    }

    
    
    private void registrarLog(String cmotivo, ChequeProveedor cheque) {
        LogChequeProveedor logcheque = new LogChequeProveedor();
        logcheque.setCmotivo(cmotivo);
        logcheque.setCobservacion(LogZarcillo.log(cheque));
        logcheque.setIdcheque(cheque);
        logcheque.setIdusuario(cheque.getIdusuario());
        logcheque.setDfecreg(new Date());
        cruddao.registrar(logcheque);
    }
    
    
    
}
