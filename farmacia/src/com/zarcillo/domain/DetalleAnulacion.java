package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "detalle_anulacion")
@NamedQueries({
    @NamedQuery(name = "DetalleAnulacion.findAll", query = "SELECT d FROM DetalleAnulacion d"),
    @NamedQuery(name = "DetalleAnulacion.findByIdanulacion", query = "SELECT d FROM DetalleAnulacion d WHERE d.idanulacion.idanulacion=:idanulacion")
})
public class DetalleAnulacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddetalle")
    private Integer iddetalle;
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Almacen idalmacen;
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(fetch = FetchType.EAGER)
    private Producto idproducto;
    @JoinColumn(name = "idanulacion", referencedColumnName = "idanulacion")
    @ManyToOne(fetch = FetchType.EAGER)
    private Anulacion idanulacion;
    @Column(name = "ncantidad")
    private Integer ncantidad;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ncosuni")
    private BigDecimal ncosuni;
    @Column(name = "ctipmov")
    private String ctipmov;
    @Column(name = "nstock")
    private Integer nstock;
    @Column(name = "nvaluni")
    private BigDecimal nvaluni;
    @Column(name = "ndesfin")
    private BigDecimal ndesfin;
    @Column(name = "ndesbon")
    private BigDecimal ndesbon;
    @Column(name = "ndeslab")
    private BigDecimal ndeslab;
    @Column(name = "binafecto")
    private Boolean binafecto;
    @Column(name = "nsubtot")
    private BigDecimal nsubtot;
    @Column(name = "cfecven")
    private String cfecven;
    @Column(name = "clote")
    private String clote;
    @Column(name = "nidregsalida")
    private Integer nidregsalida;
    @Column(name = "nidregentrada")
    private Integer nidregentrada;
    @Column(name = "norden")
    private Integer norden;
    @Column(name = "ncantidadm")
    private Integer ncantidadm;
    @Column(name = "nstockm")
    private Integer nstockm;
    @Column(name = "nmenudeo")
    private Integer nmenudeo;

    public DetalleAnulacion() {
        ncantidad = 0;
        ncantidadm = 0;
        ncosuni = new BigDecimal("0");
        ndesbon = new BigDecimal("0");
        ndesfin = new BigDecimal("0");
        ndeslab = new BigDecimal("0");
        nstock = 0;
        nstockm = 0;
        nsubtot = new BigDecimal("0");
        nvaluni = new BigDecimal("0");
        binafecto = false;
        norden = 0;
        nmenudeo = 0;
    }

    public DetalleAnulacion(Integer iddetalle) {
        this.iddetalle = iddetalle;
    }

    public Integer getIddetalle() {
        return iddetalle;
    }

    public void setIddetalle(Integer iddetalle) {
        this.iddetalle = iddetalle;
    }

    public Integer getNcantidad() {
        return ncantidad;
    }

    public void setNcantidad(Integer ncantidad) {
        this.ncantidad = ncantidad;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public String getCtipmov() {
        return ctipmov;
    }

    public void setCtipmov(String ctipmov) {
        this.ctipmov = ctipmov;
    }

    
    

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        this.nvaluni = nvaluni;
    }

    public BigDecimal getNdesfin() {
        return ndesfin;
    }

    public void setNdesfin(BigDecimal ndesfin) {
        this.ndesfin = ndesfin;
    }

    public BigDecimal getNdesbon() {
        return ndesbon;
    }

    public void setNdesbon(BigDecimal ndesbon) {
        this.ndesbon = ndesbon;
    }

    public BigDecimal getNdeslab() {
        return ndeslab;
    }

    public void setNdeslab(BigDecimal ndeslab) {
        this.ndeslab = ndeslab;
    }

    public Boolean getBinafecto() {
        return binafecto;
    }

    public void setBinafecto(Boolean binafecto) {
        this.binafecto = binafecto;
    }

    public BigDecimal getNsubtot() {
        return nsubtot;
    }

    public void setNsubtot(BigDecimal nsubtot) {
        this.nsubtot = nsubtot;
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

    public Integer getNidregsalida() {
        return nidregsalida;
    }

    public void setNidregsalida(Integer nidregsalida) {
        this.nidregsalida = nidregsalida;
    }

    public Integer getNidregentrada() {
        return nidregentrada;
    }

    public void setNidregentrada(Integer nidregentrada) {
        this.nidregentrada = nidregentrada;
    }

    public Integer getNorden() {
        return norden;
    }

    public void setNorden(Integer norden) {
        this.norden = norden;
    }

    public Integer getNcantidadm() {
        return ncantidadm;
    }

    public void setNcantidadm(Integer ncantidadm) {
        this.ncantidadm = ncantidadm;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    public Integer getNmenudeo() {
        return nmenudeo;
    }

    public void setNmenudeo(Integer nmenudeo) {
        this.nmenudeo = nmenudeo;
    }

    public Anulacion getIdanulacion() {
        return idanulacion;
    }

    public void setIdanulacion(Anulacion idanulacion) {
        this.idanulacion = idanulacion;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddetalle != null ? iddetalle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleAnulacion)) {
            return false;
        }
        DetalleAnulacion other = (DetalleAnulacion) object;
        if ((this.iddetalle == null && other.iddetalle != null) || (this.iddetalle != null && !this.iddetalle.equals(other.iddetalle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.DetalleAnulacion[ iddetalle=" + iddetalle + " ]";
    }
}
