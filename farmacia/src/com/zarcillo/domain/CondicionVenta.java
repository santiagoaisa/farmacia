package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "condicion_venta")
@NamedQueries({
    @NamedQuery(name = "CondicionVenta.findAll", query = "SELECT c FROM CondicionVenta c ORDER BY c.cnomcondicion")})
public class CondicionVenta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcondicion")
    private Integer idcondicion;
    @Column(name = "cnomcondicion")
    private String cnomcondicion;
    @Column(name = "bcontado")
    private Boolean bcontado;
    @Column(name = "nplazo")
    private Integer nplazo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ndescuento")
    private BigDecimal ndescuento;
    @Column(name = "nincremento")
    private BigDecimal nincremento;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;

    public CondicionVenta() {
        bcontado=false;
        ndescuento=new BigDecimal("0");
        nincremento=new BigDecimal("0");
        nplazo=0;
    }

    public CondicionVenta(Integer idcondicion) {
        this.idcondicion = idcondicion;
    }

    public Integer getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(Integer idcondicion) {
        this.idcondicion = idcondicion;
    }

    public String getCnomcondicion() {
        return cnomcondicion;
    }

    public void setCnomcondicion(String cnomcondicion) {
        this.cnomcondicion = cnomcondicion;
    }

    public Boolean getBcontado() {
        return bcontado;
    }

    public void setBcontado(Boolean bcontado) {
        this.bcontado = bcontado;
    }

    public Integer getNplazo() {
        return nplazo;
    }

    public void setNplazo(Integer nplazo) {
        this.nplazo = nplazo;
    }

    public BigDecimal getNdescuento() {
        return ndescuento;
    }

    public void setNdescuento(BigDecimal ndescuento) {
        this.ndescuento = ndescuento;
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

    public BigDecimal getNincremento() {
        return nincremento;
    }

    public void setNincremento(BigDecimal nincremento) {
        this.nincremento = nincremento;
    }
    
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcondicion != null ? idcondicion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CondicionVenta)) {
            return false;
        }
        CondicionVenta other = (CondicionVenta) object;
        if ((this.idcondicion == null && other.idcondicion != null) || (this.idcondicion != null && !this.idcondicion.equals(other.idcondicion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomcondicion;
    }
    
}
