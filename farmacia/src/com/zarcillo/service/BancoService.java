package com.zarcillo.service;

import com.zarcillo.domain.Banco;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface BancoService {
        public Banco registrar(Banco banco);
    public Banco actualizar(Banco banco);
    public void eliminar(Banco banco);
    public Banco buscar(Integer idbanco);
    public List<Banco> listaGeneral();
}
