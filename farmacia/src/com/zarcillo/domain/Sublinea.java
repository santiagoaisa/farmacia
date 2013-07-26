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
@Table(name = "sublinea")
@NamedQueries({
    @NamedQuery(name = "Sublinea.findAll", query = "SELECT s FROM Sublinea s")})
public class Sublinea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idsublinea")
    private Integer idsublinea;
    @Column(name = "cnomsublinea")
    private String cnomsublinea;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idlinea", referencedColumnName = "idlinea")
    @ManyToOne(fetch = FetchType.EAGER)
    private Linea idlinea;
   

    public Sublinea() {        
    }

    public Sublinea(Integer idsublinea) {
        this.idsublinea = idsublinea;
    }

    public Integer getIdsublinea() {
        return idsublinea;
    }

    public void setIdsublinea(Integer idsublinea) {
        this.idsublinea = idsublinea;
    }

    public String getCnomsublinea() {
        return cnomsublinea;
    }

    public void setCnomsublinea(String cnomsublinea) {
        this.cnomsublinea = cnomsublinea;
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

    public Linea getIdlinea() {
        return idlinea;
    }

    public void setIdlinea(Linea idlinea) {
        this.idlinea = idlinea;
    }

 

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsublinea != null ? idsublinea.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sublinea)) {
            return false;
        }
        Sublinea other = (Sublinea) object;
        if ((this.idsublinea == null && other.idsublinea != null) || (this.idsublinea != null && !this.idsublinea.equals(other.idsublinea))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomsublinea;
    }
    
}
