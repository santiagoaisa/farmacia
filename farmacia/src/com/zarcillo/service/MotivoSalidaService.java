package com.zarcillo.service;

import com.zarcillo.domain.MotivoSalida;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoSalidaService {
    
     public MotivoSalida registrar(MotivoSalida motivo);
    public MotivoSalida actualizar(MotivoSalida motivo);
    public void eliminar(MotivoSalida motivo);
    public MotivoSalida buscar(Integer idmotivo);
    public List<MotivoSalida> listaGeneral();
    
}
