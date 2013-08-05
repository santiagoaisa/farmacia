package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

public class Inventario implements Serializable {

    private Producto idproducto;
    private Integer nstock;    
    private String cubicacion;

    public Inventario() {
        nstock = 0;        
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

  

   
}
