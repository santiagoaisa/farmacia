package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.domain.Documento;
import com.zarcillo.estado.MotivoLog;
import com.zarcillo.log.LogDocumento;
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
@Service("documentoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DocumentoServiceImpl implements DocumentoService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private DocumentoDAO documentodao;

    @Override
    @Transactional
    public Documento registrar(Documento documento) {
        try {
            documento.setDfecreg(new Date());
            cruddao.registrar(documento);
            //LOG
            registrarLog(MotivoLog.REGISTRO.toString(), documento);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al crear un Documento");
        }
        return documento;
    }

    @Override
    @Transactional
    public Documento actualizar(Documento documento) {
        try {
            cruddao.actualizar(documento);
            //LOG
            registrarLog(MotivoLog.ACTUALIZACION.toString(), documento);
            //LOG
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al actualizar un Documento");
        }
        return documento;
    }

    @Override
    @Transactional
    public void eliminar(Documento documento) {
        try {
            cruddao.eliminar(documento);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error al eliminar un Documento");
        }
    }

    @Override
    public Documento buscar(Integer iddocumento) {
        try {
            return documentodao.busqueda(iddocumento);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No exite el documento con id:" + iddocumento);
        }
    }

    @Override
   
    public List<Documento> listaGeneral() {
        return cruddao.listarTodos(Documento.class);
    }

    @Override
    public List<Documento> listaDocumentoVenta() {
        return documentodao.listaPorBventa();
    }

    @Override
    public List<Documento> listaDocumentoCompra() {
        return documentodao.listaPorBcompra();
    }

    @Override
    public List<Documento> listaDocumentoPago() {
        return documentodao.listaPorBpago();
    }
    
    
    
    

    private void registrarLog(String cmotivo, Documento documento) {
        LogDocumento logdocumento = new LogDocumento();
        logdocumento.setCmotivo(cmotivo);
        logdocumento.setCobservacion(LogZarcillo.log(documento));
        logdocumento.setIddocumento(documento);
        logdocumento.setIdusuario(documento.getIdusuario());
        logdocumento.setDfecreg(new Date());
        cruddao.registrar(logdocumento);
    }
}
