package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;

public class Inventario implements Serializable {

    private Producto idproducto;
    private Integer nstock;    
    private Integer nstockm;    
    private String cubicacion;
    private BigDecimal ncosuni;
    
     private BigDecimal nsubcos;
    private BigDecimal nprecos;

    public Inventario() {
        nstock = 0;        
         nstockm = 0;  
         ncosuni=new BigDecimal("0");         
         nsubcos=new BigDecimal("0");
         nprecos=new BigDecimal("0");
         
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }    

    public String getCubicacion() {
        return cubicacion;
    }

    public void setCubicacion(String cubicacion) {
        this.cubicacion = cubicacion;
    }

    

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNsubcos() {
        return nsubcos;
    }

    public void setNsubcos(BigDecimal nsubcos) {
        this.nsubcos = nsubcos;
    }

    public BigDecimal getNprecos() {
        return nprecos;
    }

    public void setNprecos(BigDecimal nprecos) {
        this.nprecos = nprecos;
    }

   

    

   
}
