package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class DetalleInventarioValorizado implements Serializable{
    
    private Almacen idalmacen;
    private Producto idproducto;
    private Integer nstock;
    private Integer nstockm;
    
    private BigDecimal ncosuni;
    private BigDecimal nultcos;
    private BigDecimal nvalven;
    private Boolean bactivo;
    
    private BigDecimal nsubcos;
    private BigDecimal nsubpre;
    
     
    private Integer nminimo;

    public DetalleInventarioValorizado() {
        ncosuni=new BigDecimal("0");
        nminimo=0;
        nstock=0;
        nsubcos=new BigDecimal("0");
        nsubpre=new BigDecimal("0");
        nultcos=new BigDecimal("0");
        nvalven=new BigDecimal("0");
        nstockm=0;
        
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
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

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNultcos() {
        return nultcos;
    }

    public void setNultcos(BigDecimal nultcos) {
        this.nultcos = nultcos;
    }

    public BigDecimal getNvalven() {
        return nvalven;
    }

    public void setNvalven(BigDecimal nvalven) {
        this.nvalven = nvalven;
    }

    public Boolean getBactivo() {
        return bactivo;
    }

    public void setBactivo(Boolean bactivo) {
        this.bactivo = bactivo;
    }

    public Integer getNminimo() {
        return nminimo;
    }

    public void setNminimo(Integer nminimo) {
        this.nminimo = nminimo;
    }

    public BigDecimal getNsubcos() {
        return nsubcos;
    }

    public void setNsubcos(BigDecimal nsubcos) {
        this.nsubcos = nsubcos;
    }

    public BigDecimal getNsubpre() {
        return nsubpre;
    }

    public void setNsubpre(BigDecimal nsubpre) {
        this.nsubpre = nsubpre;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    
    
    
    @Override
    public String toString() {
        return "DetalleInventarioValorizado{" + "idproducto=" + idproducto + '}';
    }
    
    
    
    
    
    
}
