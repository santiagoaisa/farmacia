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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "autorizacion")
@NamedQueries({
    @NamedQuery(name = "Autorizacion.findAll", query = "SELECT a FROM Autorizacion a ORDER BY a.cnomautorizacion"),
    @NamedQuery(name = "Autorizacion.findByIdautorizacion", query = "SELECT a FROM Autorizacion a WHERE a.idautorizacion=:idautorizacion")    
})
public class Autorizacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idautorizacion")
    private Integer idautorizacion;
    @Column(name = "cnomautorizacion")
    private String cnomautorizacion;
    
     @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    

    public Autorizacion() {
    }

    public Autorizacion(Integer idautorizacion) {
        this.idautorizacion = idautorizacion;
    }

    public Integer getIdautorizacion() {
        return idautorizacion;
    }

    public void setIdautorizacion(Integer idautorizacion) {
        this.idautorizacion = idautorizacion;
    }

 
    

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public String getCnomautorizacion() {
        return cnomautorizacion;
    }

    public void setCnomautorizacion(String cnomautorizacion) {
        this.cnomautorizacion = cnomautorizacion;
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
        hash += (idautorizacion != null ? idautorizacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Autorizacion)) {
            return false;
        }
        Autorizacion other = (Autorizacion) object;
        if ((this.idautorizacion == null && other.idautorizacion != null) || (this.idautorizacion != null && !this.idautorizacion.equals(other.idautorizacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomautorizacion;
    }
    
}
