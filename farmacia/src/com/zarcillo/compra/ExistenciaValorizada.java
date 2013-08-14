package com.zarcillo.compra;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class ExistenciaValorizada implements Serializable{
    private Producto idproducto;
    private Almacen idalmacen;
    private Integer nstock;
    private Integer nstockm;
    private BigDecimal ncosuni;
    
    private BigDecimal nsubcos;
    private BigDecimal nprecos;

    public ExistenciaValorizada() {
        ncosuni=new BigDecimal("0");
        nprecos=new BigDecimal("0");
        nsubcos=new BigDecimal("0");
        nstock=0;
        nstockm=0;
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
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

    public BigDecimal getNprecos() {
        return nprecos;
    }

    public void setNprecos(BigDecimal nprecos) {
        this.nprecos = nprecos;
    }

    public BigDecimal getNsubcos() {
        return nsubcos;
    }

    public void setNsubcos(BigDecimal nsubcos) {
        this.nsubcos = nsubcos;
    }
    
    
    
    
    
    
}
