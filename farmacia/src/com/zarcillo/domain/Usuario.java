package com.zarcillo.domain;

import java.io.Serializable;
import java.util.ArrayList;
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
import org.zkoss.util.CollectionsX;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "usuario")
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByIdrol", query = "SELECT u FROM Usuario u WHERE u.idrol.idrol=:idrol ORDER BY u.cnomusuario"),
    @NamedQuery(name = "Usuario.findByIdusuario", query = "SELECT u FROM Usuario u WHERE u.idusuario=:idusuario"),
    @NamedQuery(name = "Usuario.findByClogin", query = "SELECT u FROM Usuario u WHERE u.clogin=:clogin"),
    @NamedQuery(name = "Usuario.findByCloginByCclave", query = "SELECT u FROM Usuario u where u.clogin=:clogin and u.cclave=:cclave")
})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idusuario")
    private Integer idusuario;
    @Column(name = "cnomusuario")
    private String cnomusuario;
    @Column(name = "bactivo")
    private Boolean bactivo;
    @Column(name = "clogin")
    private String clogin;
    @Column(name = "cclave")
    private String cclave;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "dfecmod")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecmod;
    @JoinColumn(name = "idrol", referencedColumnName = "idrol")
    @ManyToOne(fetch = FetchType.EAGER)
    private Rol idrol;
    
    @Column(name = "cabrev")
    private String cabrev;
    
    @OneToMany(mappedBy = "idusuario", fetch = FetchType.LAZY)
    private List<DetalleAutorizacion> detalleAutorizacionCollection;

    public Usuario() {        
    }

    public Usuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public Integer getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public String getCnomusuario() {
        return cnomusuario;
    }

    public void setCnomusuario(String cnomusuario) {
        this.cnomusuario = cnomusuario;
    }

    public Boolean getBactivo() {
        return bactivo;
    }

    public void setBactivo(Boolean bactivo) {
        this.bactivo = bactivo;
    }

    public String getClogin() {
        return clogin;
    }

    public void setClogin(String clogin) {
        this.clogin = clogin;
    }

    public String getCclave() {
        return cclave;
    }

    public void setCclave(String cclave) {
        this.cclave = cclave;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Date getDfecmod() {
        return dfecmod;
    }

    public void setDfecmod(Date dfecmod) {
        this.dfecmod = dfecmod;
    }

    public Rol getIdrol() {
        return idrol;
    }

    public void setIdrol(Rol idrol) {
        this.idrol = idrol;
    }

    public List<DetalleAutorizacion> getDetalleAutorizacionCollection() {
        return detalleAutorizacionCollection;
    }

    public void setDetalleAutorizacionCollection(List<DetalleAutorizacion> detalleAutorizacionCollection) {
        this.detalleAutorizacionCollection = detalleAutorizacionCollection;
    }

    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idusuario != null ? idusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idusuario == null && other.idusuario != null) || (this.idusuario != null && !this.idusuario.equals(other.idusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomusuario;
    }
}
