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
@Table(name = "presentacion")
@NamedQueries({
    @NamedQuery(name = "Presentacion.findAll", query = "SELECT p FROM Presentacion p")})
public class Presentacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpresentacion")
    private Integer idpresentacion;
    @Column(name = "cnompresentacion")
    private String cnompresentacion;
    @Column(name = "cabrev")
    private String cabrev;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "bactivo")
    private Boolean bactivo;
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;

    public Presentacion() {
        bactivo=false;
    }

    public Presentacion(Integer idpresentacion) {
        this.idpresentacion = idpresentacion;
    }

    public Integer getIdpresentacion() {
        return idpresentacion;
    }

    public void setIdpresentacion(Integer idpresentacion) {
        this.idpresentacion = idpresentacion;
    }

    public String getCnompresentacion() {
        return cnompresentacion;
    }

    public void setCnompresentacion(String cnompresentacion) {
        this.cnompresentacion = cnompresentacion;
    }

    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
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
        hash += (idpresentacion != null ? idpresentacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Presentacion)) {
            return false;
        }
        Presentacion other = (Presentacion) object;
        if ((this.idpresentacion == null && other.idpresentacion != null) || (this.idpresentacion != null && !this.idpresentacion.equals(other.idpresentacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnompresentacion;
    }
    
}
