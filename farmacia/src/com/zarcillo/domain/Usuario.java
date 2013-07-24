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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByClogin", query = "SELECT u FROM Usuario u WHERE u.clogin=:clogin")        ,
    @NamedQuery(name = "Usuario.findByCloginByCclave", query = "SELECT u FROM Usuario u where u.clogin=:clogin and u.cclave=:cclave") 
})

@SequenceGenerator(name = "seq_usuario", sequenceName = "seq_usuario", allocationSize = 1)
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id    
    @Basic(optional = false)
    @Column(name = "idusuario")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_usuario")
    private Integer idusuario;
    @Column(name = "cnomusuario")
    private String cnomusuario;
    @Column(name = "bactivo")
    private boolean bactivo;
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
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Rol idrol;

    public Usuario() {
        clogin = "SIN_LOGIN";
        cclave = "SIN_CLAVE";
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

    public boolean isBactivo() {
        return bactivo;
    }

    public void setBactivo(boolean bactivo) {
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
