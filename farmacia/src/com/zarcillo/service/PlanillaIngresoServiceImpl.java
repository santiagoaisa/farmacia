package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.dto.caja.CobroPorDocumento;
import java.math.BigDecimal;
import java.util.ArrayList;
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
    @Autowired
    private AmortizacionClienteDAO amortizaciondao; 
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;

    @Override
    public List<CobroPorDocumento> listaCobroPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad, Integer idusuario, Date fecha1, Date fecha2) {
        List<CobroPorDocumento> listaCobro=resultadodao.listaVentaPorDocumentoPorIdunidadPorIdusuarioPorFechas(idunidad, idusuario, fecha1, fecha2);
        List<CobroPorDocumento> listaRetorno=new ArrayList<>();
        
        CobroPorDocumento cobro;
        List<AmortizacionCliente> listaAmortizacion;
        ComprobanteEmitido comprobante;
        BigDecimal nmonto;
        for(CobroPorDocumento c:listaCobro){
            
            cobro=new CobroPorDocumento();            
            cobro.setId(c.getId());
            cobro.setIdcondicion(c.getIdcondicion());
            cobro.setIddocumento(c.getIddocumento());
            cobro.setIdregsalida(c.getIdregsalida());
            cobro.setCserie(c.getCserie());
            cobro.setCnumero(c.getCnumero());
            cobro.setDfecemi(c.getDfecemi());            
            cobro.setNimporte(c.getNimporte());
            cobro.setNacuenta(c.getNacuenta());
            cobro.setNsaldo(c.getNsaldo());
            
            comprobante=comprobantedao.buscarPorIdregsalida(c.getIdregsalida());            
            listaAmortizacion=amortizaciondao.listaPorIdcomprobante(comprobante.getIdcomprobante());
            
            nmonto=new BigDecimal("0");
            for(AmortizacionCliente a:listaAmortizacion){
                nmonto=nmonto.add(a.getNimporte());
            }
            cobro.setNmonto(nmonto);
            
            if(!listaRetorno.contains(cobro)){
                listaRetorno.add(cobro);
            }
            
            
        }
        
        return listaRetorno;
    }
    
    
}
