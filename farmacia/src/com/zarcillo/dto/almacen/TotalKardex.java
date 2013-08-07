package com.zarcillo.dto.almacen;

import java.io.Serializable;


public class TotalKardex implements Serializable {

    private Integer ntcompra;
    private Integer ntventa;
    private Integer nstock;

    public TotalKardex() {
        ntcompra=0;
        ntventa=0;
        nstock=0;
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

}
