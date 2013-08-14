package com.zarcillo.estadistica;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Producto;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "util.ventapordocumento")
public class VentaPorDocumento implements Serializable {

    @Id
    private BigDecimal id;
    private Integer idregsalida;
    @JoinColumn(name = "iddocumento", referencedColumnName = "idproducto")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
     
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dfecemi;
    
    private Documento iddocumento;
    private String cserie;
    private String cnumero;
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    private BigDecimal nafecto;
    private BigDecimal ninafecto;
    private BigDecimal nigv;
    private BigDecimal nredondeo;
    private BigDecimal nimporte;
    private BigDecimal ncosto;
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Producto idproducto;
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Almacen idalmacen;
    private Integer nentero;
    private Integer nfraccion;
    private String clote;
    private BigDecimal nsubtot;    
    private BigDecimal nsubcos;    
    private BigDecimal nprecos;
    private BigDecimal nprecio;
    private BigDecimal nutilidad;

    public VentaPorDocumento() {
        nafecto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        nprecio = new BigDecimal("0");
        nentero = 0;
        nfraccion = 0;
        nsubtot = new BigDecimal("0");
        nsubcos = new BigDecimal("0");
        nprecos = new BigDecimal("0");
        nprecio = new BigDecimal("0");
        nutilidad = new BigDecimal("0");
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Integer getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(Integer idregsalida) {
        this.idregsalida = idregsalida;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getCserie() {
        return cserie;
    }

    public void setCserie(String cserie) {
        this.cserie = cserie;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
    }

    public CondicionVenta getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(CondicionVenta idcondicion) {
        this.idcondicion = idcondicion;
    }

    public BigDecimal getNafecto() {
        return nafecto;
    }

    public void setNafecto(BigDecimal nafecto) {
        this.nafecto = nafecto;
    }

    public BigDecimal getNinafecto() {
        return ninafecto;
    }

    public void setNinafecto(BigDecimal ninafecto) {
        this.ninafecto = ninafecto;
    }

    public BigDecimal getNigv() {
        return nigv;
    }

    public void setNigv(BigDecimal nigv) {
        this.nigv = nigv;
    }

    public BigDecimal getNredondeo() {
        return nredondeo;
    }

    public void setNredondeo(BigDecimal nredondeo) {
        this.nredondeo = nredondeo;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
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

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

    public BigDecimal getNsubtot() {
        return nsubtot;
    }

    public void setNsubtot(BigDecimal nsubtot) {
        this.nsubtot = nsubtot;
    }

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
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

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
    }
    
    
    
    
}
