package com.zarcillo.service;

import com.zarcillo.domain.MotivoEntrada;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoEntradaService {
 
    public MotivoEntrada registrar(MotivoEntrada motivo);
    public MotivoEntrada actualizar(MotivoEntrada motivo);
    public void eliminar(MotivoEntrada motivo);
    public MotivoEntrada buscar(Integer idmotivo);
    public List<MotivoEntrada> listaGeneral();
}
