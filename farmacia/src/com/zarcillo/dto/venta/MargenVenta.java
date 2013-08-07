package com.zarcillo.dto.venta;

import java.io.Serializable;
import java.math.BigDecimal;

public class MargenVenta implements Serializable {

    private boolean bmargen;
    private String cmensaje;    
    private BigDecimal nmargen;

    public MargenVenta() {
        nmargen = new BigDecimal("0");
        bmargen=false;
    }

    public boolean isBmargen() {
        return bmargen;
    }

    public void setBmargen(boolean bmargen) {
        this.bmargen = bmargen;
    }

    public String getCmensaje() {
        return cmensaje;
    }

    public void setCmensaje(String cmensaje) {
        this.cmensaje = cmensaje;
    }

   

    public BigDecimal getNmargen() {
        return nmargen;
    }

    public void setNmargen(BigDecimal nmargen) {
        this.nmargen = nmargen;
    }
}
