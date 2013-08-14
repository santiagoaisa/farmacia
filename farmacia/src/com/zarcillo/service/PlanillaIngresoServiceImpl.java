package com.zarcillo.service;

import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.dto.caja.CobroPorDocumento;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

/**
 *
 * @author saisa
 */
@Service("planillaIngresoService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PlanillaIngresoServiceImpl implements PlanillaIngresoService{
    
    @Autowired
    private ResultadoVentaDAO resultadodao; 

    @Override
    public List<CobroPorDocumento> listaCobroPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad, Integer idusuario, Date fecha1, Date fecha2) {
        return resultadodao.listaVentaPorDocumentoPorIdunidadPorIdusuarioPorFechas(idunidad, idusuario, fecha1, fecha2);
    }
    
    
}
