package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "existencia")
@NamedQueries({
    @NamedQuery(name = "Existencia.findAll", query = "SELECT e FROM Existencia e")})
public class Existencia implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExistenciaPK existenciaPK;
    @Column(name = "nstock")
    private Integer nstock;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ncosuni")
    private BigDecimal ncosuni;
    @Column(name = "nultcos")
    private BigDecimal nultcos;
    @Column(name = "nvalven")
    private BigDecimal nvalven;
    @Column(name = "nincremento")
    private BigDecimal nincremento;
    @Column(name = "bactivo")
    private Boolean bactivo;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;

    public Existencia() {
        bactivo=false;
        ncosuni=new BigDecimal("0");
        nincremento=new BigDecimal("0");
        nstock=0;
        nultcos=new BigDecimal("0");
        nvalven=new BigDecimal("0");        
    }

    public Existencia(ExistenciaPK existenciaPK) {
        this.existenciaPK = existenciaPK;
    }

    public Existencia(int idalmacen, String idproducto) {
        this.existenciaPK = new ExistenciaPK(idalmacen, idproducto);
    }

    public ExistenciaPK getExistenciaPK() {
        return existenciaPK;
    }

    public void setExistenciaPK(ExistenciaPK existenciaPK) {
        this.existenciaPK = existenciaPK;
    }

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNultcos() {
        return nultcos;
    }

    public void setNultcos(BigDecimal nultcos) {
        this.nultcos = nultcos;
    }

    public BigDecimal getNvalven() {
        return nvalven;
    }

    public void setNvalven(BigDecimal nvalven) {
        this.nvalven = nvalven;
    }

    public BigDecimal getNincremento() {
        return nincremento;
    }

    public void setNincremento(BigDecimal nincremento) {
        this.nincremento = nincremento;
    }

    public Boolean getBactivo() {
        return bactivo;
    }

    public void setBactivo(Boolean bactivo) {
        this.bactivo = bactivo;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

   

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (existenciaPK != null ? existenciaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Existencia)) {
            return false;
        }
        Existencia other = (Existencia) object;
        if ((this.existenciaPK == null && other.existenciaPK != null) || (this.existenciaPK != null && !this.existenciaPK.equals(other.existenciaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return existenciaPK.getIdproducto();
    }
    
}
