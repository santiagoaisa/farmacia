package com.zarcillo.domain;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "ubigeo")
@NamedQueries({
    @NamedQuery(name = "Ubigeo.findAll", query = "SELECT u FROM Ubigeo u")})
public class Ubigeo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idubigeo")
    private String idubigeo;
    @Column(name = "cubigeo")
    private String cubigeo;
    @Column(name = "cdepartamento")
    private String cdepartamento;
    @Column(name = "cprovincia")
    private String cprovincia;
    @Column(name = "cdistrito")
    private String cdistrito;
    @Column(name = "cnomdepartamento")
    private String cnomdepartamento;
    @Column(name = "cnomprovincia")
    private String cnomprovincia;
    
    

    public Ubigeo() {
    }

    public Ubigeo(String idubigeo) {
        this.idubigeo = idubigeo;
    }

    public String getIdubigeo() {
        return idubigeo;
    }

    public void setIdubigeo(String idubigeo) {
        this.idubigeo = idubigeo;
    }

    public String getCubigeo() {
        return cubigeo;
    }

    public void setCubigeo(String cubigeo) {
        this.cubigeo = cubigeo;
    }

    public String getCdepartamento() {
        return cdepartamento;
    }

    public void setCdepartamento(String cdepartamento) {
        this.cdepartamento = cdepartamento;
    }

    public String getCprovincia() {
        return cprovincia;
    }

    public void setCprovincia(String cprovincia) {
        this.cprovincia = cprovincia;
    }

    public String getCdistrito() {
        return cdistrito;
    }

    public void setCdistrito(String cdistrito) {
        this.cdistrito = cdistrito;
    }

    public String getCnomdepartamento() {
        return cnomdepartamento;
    }

    public void setCnomdepartamento(String cnomdepartamento) {
        this.cnomdepartamento = cnomdepartamento;
    }

    public String getCnomprovincia() {
        return cnomprovincia;
    }

    public void setCnomprovincia(String cnomprovincia) {
        this.cnomprovincia = cnomprovincia;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idubigeo != null ? idubigeo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ubigeo)) {
            return false;
        }
        Ubigeo other = (Ubigeo) object;
        if ((this.idubigeo == null && other.idubigeo != null) || (this.idubigeo != null && !this.idubigeo.equals(other.idubigeo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cubigeo;
    }
    
}
