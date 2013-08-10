package com.zarcillo.dto.almacen;

import java.io.Serializable;


public class TotalKardex implements Serializable {

    private Integer ntcompra;
    private Integer ntventa;
    private Integer nstock;
    
    private Integer ntcompram;
    private Integer ntventam;
    private Integer nstockm;

    public TotalKardex() {
        ntcompra=0;
        ntventa=0;
        nstock=0;
        
        ntcompram=0;
        ntventam=0;
        nstockm=0;
    }

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public Integer getNtcompra() {
        return ntcompra;
    }

    public void setNtcompra(Integer ntcompra) {
        this.ntcompra = ntcompra;
    }

    public Integer getNtventa() {
        return ntventa;
    }

    public void setNtventa(Integer ntventa) {
        this.ntventa = ntventa;
    }

    public Integer getNtcompram() {
        return ntcompram;
    }

    public void setNtcompram(Integer ntcompram) {
        this.ntcompram = ntcompram;
    }

    public Integer getNtventam() {
        return ntventam;
    }

    public void setNtventam(Integer ntventam) {
        this.ntventam = ntventam;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    
    
}
