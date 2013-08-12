package com.zarcillo.dao;

import com.zarcillo.domain.MotivoSalida;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface MotivoSalidaDAO {
    MotivoSalida busqueda(Integer idmotivo);
    List<MotivoSalida> listaGeneral();
    List<MotivoSalida> listaVenta();
}
