package com.zarcillo.log;

import com.zarcillo.domain.Sublinea;
import com.zarcillo.domain.Usuario;
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
@Table(name = "log.log_sublinea")
@NamedQueries({
    @NamedQuery(name = "LogSublinea.findAll", query = "SELECT l FROM LogSublinea l")})
public class LogSublinea implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlog")
    private Integer idlog;
    
    @JoinColumn(name = "idsublinea", referencedColumnName = "idsublinea")
    @ManyToOne(fetch = FetchType.EAGER)
    private Sublinea idsublinea;
    
    @Column(name = "cmotivo")
    private String cmotivo;
    @Column(name = "cobservacion")
    private String cobservacion;
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public LogSublinea() {
    }

    public LogSublinea(Integer idlog) {
        this.idlog = idlog;
    }

  

    public Integer getIdlog() {
        return idlog;
    }

    public void setIdlog(Integer idlog) {
        this.idlog = idlog;
    }
  
    public String getCmotivo() {
        return cmotivo;
    }

    public void setCmotivo(String cmotivo) {
        this.cmotivo = cmotivo;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
    }

    public Sublinea getIdsublinea() {
        return idsublinea;
    }

    public void setIdsublinea(Sublinea idsublinea) {
        this.idsublinea = idsublinea;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

  

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlog != null ? idlog.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LogSublinea)) {
            return false;
        }
        LogSublinea other = (LogSublinea) object;
        if ((this.idlog == null && other.idlog != null) || (this.idlog != null && !this.idlog.equals(other.idlog))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.log.LogSublinea[ idlog=" + idlog + " ]";
    }
    
}
