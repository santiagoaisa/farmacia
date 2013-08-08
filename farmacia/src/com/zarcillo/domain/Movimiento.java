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
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "movimiento")
@NamedQueries({
    @NamedQuery(name = "Movimiento.findAll", query = "SELECT m FROM Movimiento m"),
    @NamedQuery(name = "Movimiento.findByIdregsalida", query = "SELECT m FROM Movimiento m WHERE m.idregsalida.idregsalida=:idregsalida"),
    @NamedQuery(name = "Movimiento.findByIdregentrada", query = "SELECT m FROM Movimiento m WHERE m.idregentrada.idregentrada=:idregentrada")
})
public class Movimiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmovimiento")
    private Integer idmovimiento;
    @JoinColumns({
        @JoinColumn(name = "idproducto", referencedColumnName = "idproducto"),
        @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")})
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Existencia existencia;
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
    @JoinColumn(name = "idregentrada", referencedColumnName = "idregentrada")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroEntrada idregentrada;
    @JoinColumn(name = "idregsalida", referencedColumnName = "idregsalida")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroSalida idregsalida;
    
    @Column(name = "norden")
    private Integer norden;

    public Movimiento() {
        ncantidad = 0;
        ncosuni = new BigDecimal("0");
        ndesbon = new BigDecimal("0");
        ndesfin = new BigDecimal("0");
        ndeslab = new BigDecimal("0");
        nstock = 0;
        nsubtot = new BigDecimal("0");
        nvaluni = new BigDecimal("0");
        binafecto = false;
        norden=0;
    }

    public Movimiento(Integer idmovimiento) {
        this.idmovimiento = idmovimiento;
    }

    public Integer getIdmovimiento() {
        return idmovimiento;
    }

    public void setIdmovimiento(Integer idmovimiento) {
        this.idmovimiento = idmovimiento;
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

    public Existencia getExistencia() {
        return existencia;
    }

    public void setExistencia(Existencia existencia) {
        this.existencia = existencia;
    }

    public RegistroEntrada getIdregentrada() {
        return idregentrada;
    }

    public void setIdregentrada(RegistroEntrada idregentrada) {
        this.idregentrada = idregentrada;
    }

    public RegistroSalida getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(RegistroSalida idregsalida) {
        this.idregsalida = idregsalida;
    }

    public Integer getNorden() {
        return norden;
    }

    public void setNorden(Integer norden) {
        this.norden = norden;
    }
    
     //se usara para el descargo de lotes
    public BigDecimal calculaSubtotal() {
        BigDecimal nvalorunitario = nvaluni.setScale(4, BigDecimal.ROUND_HALF_UP);
        nsubtot = nvalorunitario.multiply(new BigDecimal(this.ncantidad));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesfin.divide(new BigDecimal("100"))));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesbon.divide(new BigDecimal("100"))));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndeslab.divide(new BigDecimal("100"))));        
        nsubtot = nsubtot.setScale(2, BigDecimal.ROUND_HALF_UP);
        return nsubtot;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmovimiento != null ? idmovimiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Movimiento)) {
            return false;
        }
        Movimiento other = (Movimiento) object;
        if ((this.idmovimiento == null && other.idmovimiento != null) || (this.idmovimiento != null && !this.idmovimiento.equals(other.idmovimiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.Movimiento[ idmovimiento=" + idmovimiento + " ]";
    }
}
