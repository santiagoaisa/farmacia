package com.zarcillo.dao;

import com.zarcillo.domain.Documento;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface DocumentoDAO {
    
    Documento busqueda(Integer iddocumento);
    List<Documento> listaPorBcompra();
    List<Documento> listaPorBventa();
    List<Documento> listaPorBpago();
}
