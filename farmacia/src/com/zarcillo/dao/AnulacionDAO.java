package com.zarcillo.dao;

import com.zarcillo.domain.Anulacion;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public interface AnulacionDAO {
    
    List<Anulacion> listaPorFechas(Date dfecha1, Date dfecha2) ;
    List<String> listaSeriesPorIdunidadPorIddocumentoPorFechas(Integer idunidad,Integer iddocumento, Date fecha1, Date fecha2);
    String  minimoPorIddocumentoPorCserie(Integer iddocumento,String cserie, Date fecha1,Date fecha2);
    String  maximoPorIddocumentoPorCserie(Integer iddocumento,String cserie, Date fecha1,Date fecha2);    
    
}
