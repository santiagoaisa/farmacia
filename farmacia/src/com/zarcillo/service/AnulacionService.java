package com.zarcillo.service;

import com.zarcillo.domain.Anulacion;
import com.zarcillo.domain.MotivoAnulacion;
import com.zarcillo.domain.Usuario;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AnulacionService {
    
    public void anular(Integer idregsalida,MotivoAnulacion motivo,Usuario usuario);
    public List<Anulacion> listaPorFechas(Date dfecha1,Date dfecha2);
    
}
