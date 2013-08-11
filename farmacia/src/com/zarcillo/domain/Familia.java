package com.zarcillo.domain;

import java.io.Serializable;
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
@Table(name = "familia")
@NamedQueries({
    @NamedQuery(name = "Familia.findAll", query = "SELECT f FROM Familia f ORDER BY f.cnomfamilia  "),
    @NamedQuery(name = "Familia.findByIdfamilia", query = "SELECT f FROM Familia f WHERE f.idfamilia=:idfamilia")
})
public class Familia implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idfamilia")
    private Integer idfamilia;
    @Column(name = "cnomfamilia")
    private String cnomfamilia;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "bactivo")
    private Boolean bactivo;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    

    public Familia() {
        bactivo=false;
    }

    public Familia(Integer idfamilia) {
        this.idfamilia = idfamilia;
    }

    public Integer getIdfamilia() {
        return idfamilia;
    }

    public void setIdfamilia(Integer idfamilia) {
        this.idfamilia = idfamilia;
    }

    public String getCnomfamilia() {
        return cnomfamilia;
    }

    public void setCnomfamilia(String cnomfamilia) {
        this.cnomfamilia = cnomfamilia;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Boolean getBactivo() {
        return bactivo;
    }

    public void setBactivo(Boolean bactivo) {
        this.bactivo = bactivo;
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
        hash += (idfamilia != null ? idfamilia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Familia)) {
            return false;
        }
        Familia other = (Familia) object;
        if ((this.idfamilia == null && other.idfamilia != null) || (this.idfamilia != null && !this.idfamilia.equals(other.idfamilia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomfamilia;
    }
    
}
