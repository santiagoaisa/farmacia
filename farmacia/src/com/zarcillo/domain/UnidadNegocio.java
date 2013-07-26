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
@Table(name = "unidad_negocio")
@NamedQueries({
    @NamedQuery(name = "UnidadNegocio.findAll", query = "SELECT u FROM UnidadNegocio u")})
public class UnidadNegocio implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idunidad")
    private Integer idunidad;
    @Column(name = "cnomunidad")
    private String cnomunidad;
    @Column(name = "cabrev")
    private String cabrev;
    @Column(name = "cdireccion")
    private String cdireccion;
   
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idubigeo", referencedColumnName = "idubigeo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Ubigeo idubigeo;
    @JoinColumn(name = "idempresa", referencedColumnName = "idempresa")
    @ManyToOne(fetch = FetchType.EAGER)
    private Empresa idempresa;
    
    public UnidadNegocio() {
    }

    public UnidadNegocio(Integer idunidad) {
        this.idunidad = idunidad;
    }

    public Integer getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(Integer idunidad) {
        this.idunidad = idunidad;
    }

    public String getCnomunidad() {
        return cnomunidad;
    }

    public void setCnomunidad(String cnomunidad) {
        this.cnomunidad = cnomunidad;
    }

    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
    }

    public String getCdireccion() {
        return cdireccion;
    }

    public void setCdireccion(String cdireccion) {
        this.cdireccion = cdireccion;
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

    public Ubigeo getIdubigeo() {
        return idubigeo;
    }

    public void setIdubigeo(Ubigeo idubigeo) {
        this.idubigeo = idubigeo;
    }

    public Empresa getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(Empresa idempresa) {
        this.idempresa = idempresa;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idunidad != null ? idunidad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UnidadNegocio)) {
            return false;
        }
        UnidadNegocio other = (UnidadNegocio) object;
        if ((this.idunidad == null && other.idunidad != null) || (this.idunidad != null && !this.idunidad.equals(other.idunidad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomunidad;
    }
    
}
