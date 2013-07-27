package com.zarcillo.service;

import com.zarcillo.domain.Documento;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DocumentoService {
    
        public Documento registrar(Documento documento);
    public Documento actualizar(Documento documento);
    public void eliminar(Documento documento);
    public Documento buscar(Integer iddocumento);
    public List<Documento> listaGeneral();
    
}
