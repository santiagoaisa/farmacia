package com.zarcillo.log;

import com.zarcillo.domain.Presentacion;
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
@Table(name = "log.log_presentacion")
@NamedQueries({
    @NamedQuery(name = "LogPresentacion.findAll", query = "SELECT l FROM LogPresentacion l")})
public class LogPresentacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlog")
    private Integer idlog;
    @Basic(optional = false)
    
     @JoinColumn(name = "idpresentacion", referencedColumnName = "idpresentacion")
    @ManyToOne(fetch = FetchType.EAGER)
    private Presentacion idpresentacion;
    
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

    public LogPresentacion() {
    }

    public LogPresentacion(Integer idlog) {
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

    public Presentacion getIdpresentacion() {
        return idpresentacion;
    }

    public void setIdpresentacion(Presentacion idpresentacion) {
        this.idpresentacion = idpresentacion;
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
        if (!(object instanceof LogPresentacion)) {
            return false;
        }
        LogPresentacion other = (LogPresentacion) object;
        if ((this.idlog == null && other.idlog != null) || (this.idlog != null && !this.idlog.equals(other.idlog))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.log.LogPresentacion[ idlog=" + idlog + " ]";
    }
    
}
