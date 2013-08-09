package com.zarcillo.dao;

import com.zarcillo.domain.MotivoEntrada;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoEntradaDAO {
    MotivoEntrada busqueda(Integer idmotivo);
    List<MotivoEntrada> listaGeneral();
}
