package com.zarcillo.dto.venta;

import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class ListadoPrecio implements Serializable {

    private Producto idproducto;
    private Integer nstock;
    private Integer nstockm;
    private BigDecimal nmargen;
    private BigDecimal ncosuni;    
    private BigDecimal nvaluni;
    private BigDecimal npreuni;
    private BigDecimal npreunim;
    private BigDecimal nutilidad;

    public ListadoPrecio() {
        ncosuni=new BigDecimal("0");
        nmargen=new BigDecimal("0");
        npreuni=new BigDecimal("0");
        npreunim=new BigDecimal("0");
        nstock=0;
        nstockm=0;
        nvaluni=new BigDecimal("0");
        nutilidad=new BigDecimal("0");
    }
    
    
    

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
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

    public BigDecimal getNmargen() {
        return nmargen;
    }

    public void setNmargen(BigDecimal nmargen) {
        this.nmargen = nmargen;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        this.nvaluni = nvaluni;
    }

    public BigDecimal getNpreuni() {
        return npreuni;
    }

    public void setNpreuni(BigDecimal npreuni) {
        this.npreuni = npreuni;
    }

    public BigDecimal getNpreunim() {
        return npreunim;
    }

    public void setNpreunim(BigDecimal npreunim) {
        this.npreunim = npreunim;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        this.nutilidad = nutilidad;
    }

   
    public void calculaUtilidad(){
        
    }
    
    
    
}
