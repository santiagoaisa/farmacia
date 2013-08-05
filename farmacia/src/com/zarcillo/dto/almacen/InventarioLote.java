package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "util.inventariolote")
public class InventarioLote implements Serializable {

    @Id
    private BigDecimal id;
    
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Producto idproducto;
    private Integer nstock;
    private String cubicacion;
    private Integer ncanart;
    private String clote;
    private String cfecven;

    public InventarioLote() {       
        nstock = 0;
        ncanart = 0;
    }

    public String getCfecven() {
        return cfecven;
    }

    public void setCfecven(String cfecven) {
        this.cfecven = cfecven;
    }

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

   

   

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

   

    public Integer getNcanart() {
        return ncanart;
    }

    public void setNcanart(Integer ncanart) {
        this.ncanart = ncanart;
    }

   

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

   

    public String getCubicacion() {
        return cubicacion;
    }

    public void setCubicacion(String cubicacion) {
        this.cubicacion = cubicacion;
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }
    
    
    
}
