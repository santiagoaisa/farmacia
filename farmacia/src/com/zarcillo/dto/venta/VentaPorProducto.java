package com.zarcillo.dto.venta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "util.ventaporproducto")
public class VentaPorProducto implements Serializable {

    @Id
    private BigDecimal id;
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Producto idproducto;
    
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Almacen idalmacen;
    
    private Integer nentero;
    private Integer nfraccion;
    private BigDecimal nsubtot;
    private BigDecimal ncostot;
    private BigDecimal nprecos;
    private BigDecimal nprecio;
    private BigDecimal nutilidad;

    public VentaPorProducto() {
        nentero = 0;
        nfraccion = 0;
        nsubtot = new BigDecimal("0");
        ncostot = new BigDecimal("0");
        nprecos = new BigDecimal("0");
        nprecio = new BigDecimal("0");
        nutilidad = new BigDecimal("0");
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }

    public Integer getNentero() {
        return nentero;
    }

    public void setNentero(Integer nentero) {
        this.nentero = nentero;
    }

    public Integer getNfraccion() {
        return nfraccion;
    }

    public void setNfraccion(Integer nfraccion) {
        this.nfraccion = nfraccion;
    }

   

    public BigDecimal getNprecos() {
        return nprecos;
    }

    public void setNprecos(BigDecimal nprecos) {
        this.nprecos = nprecos;
    }

    public BigDecimal getNprecio() {
        return nprecio;
    }

    public void setNprecio(BigDecimal nprecio) {
        this.nprecio = nprecio;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        this.nutilidad = nutilidad;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
    }

    public BigDecimal getNsubtot() {
        return nsubtot;
    }

    public void setNsubtot(BigDecimal nsubtot) {
        this.nsubtot = nsubtot;
    }

    public BigDecimal getNcostot() {
        return ncostot;
    }

    public void setNcostot(BigDecimal ncostot) {
        this.ncostot = ncostot;
    }
    
    
    
    
}
