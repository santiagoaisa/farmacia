package com.zarcillo.service;

import com.zarcillo.dao.ResultadoVentaDAO;
import com.zarcillo.dto.venta.VentaPorProducto;
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
@Service("resultadoVentaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ResultadoVentaServiceImpl implements ResultadoVentaService{
    
     @Autowired
    private ResultadoVentaDAO resultadoventadao;

    @Override
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidadPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        List<VentaPorProducto> listaVenta=resultadoventadao.listaVentaPorProductoPorIdunidaPorFechas(idunidad, fecha1, fecha2);
        List<VentaPorProducto> listaRetorno=new ArrayList<>();
        
        VentaPorProducto venta;
        for(VentaPorProducto v:listaVenta){
            venta=new VentaPorProducto();
            venta.setIdproducto(v.getIdproducto());
            venta.setIdalmacen(v.getIdalmacen());
            venta.setNcostot(v.getNcostot());
            venta.setNsubtot(v.getNsubtot());
            venta.setNentero(v.getNentero());
            venta.setNfraccion(v.getNfraccion());
            
        }
        
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
}
