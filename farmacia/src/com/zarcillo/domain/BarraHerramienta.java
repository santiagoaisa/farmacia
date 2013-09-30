package com.zarcillo.domain;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "barra_herramienta")
@NamedQueries({
    @NamedQuery(name = "BarraHerramienta.findByIdbarra", query = "SELECT b FROM BarraHerramienta b WHERE b.idbarra=:idbarra "),
    @NamedQuery(name = "BarraHerramienta.findAll", query = "SELECT b FROM BarraHerramienta b ORDER BY b.norden")
})
public class BarraHerramienta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idbarra")
    private Integer idbarra;
    @Column(name = "cnombarra")
    private String cnombarra;
    @Column(name = "cimagen")
    private String cimagen;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "norden")
    private Integer norden;
     @Column(name = "cruta")
    private String cruta;

    public BarraHerramienta() {
        norden = 0;
    }

    public BarraHerramienta(Integer idbarra) {
        this.idbarra = idbarra;
    }

    public Integer getIdbarra() {
        return idbarra;
    }

    public void setIdbarra(Integer idbarra) {
        this.idbarra = idbarra;
    }

    public String getCnombarra() {
        return cnombarra;
    }

    public void setCnombarra(String cnombarra) {
        this.cnombarra = cnombarra;
    }

    public String getCimagen() {
        return cimagen;
    }

    public void setCimagen(String cimagen) {
        this.cimagen = cimagen;
    }

    public Integer getNorden() {
        return norden;
    }

    public void setNorden(Integer norden) {
        this.norden = norden;
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

    public String getCruta() {
        return cruta;
    }

    public void setCruta(String cruta) {
        this.cruta = cruta;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idbarra != null ? idbarra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BarraHerramienta)) {
            return false;
        }
        BarraHerramienta other = (BarraHerramienta) object;
        if ((this.idbarra == null && other.idbarra != null) || (this.idbarra != null && !this.idbarra.equals(other.idbarra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnombarra;
    }
}
