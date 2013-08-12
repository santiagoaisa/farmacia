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
@Table(name = "motivo_anulacion")
@NamedQueries({
    @NamedQuery(name = "MotivoAnulacion.findAll", query = "SELECT m FROM MotivoAnulacion m ORDER BY m.cnommotivo")})
public class MotivoAnulacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmotanu")
    private Integer idmotanu;
    @Column(name = "cnommotivo")
    private String cnommotivo;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIME)
    private Date dfecreg;

    public MotivoAnulacion() {
    }

    public MotivoAnulacion(Integer idmotanu) {
        this.idmotanu = idmotanu;
    }

    public Integer getIdmotanu() {
        return idmotanu;
    }

    public void setIdmotanu(Integer idmotanu) {
        this.idmotanu = idmotanu;
    }

    public String getCnommotivo() {
        return cnommotivo;
    }

    public void setCnommotivo(String cnommotivo) {
        this.cnommotivo = cnommotivo;
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
        hash += (idmotanu != null ? idmotanu.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MotivoAnulacion)) {
            return false;
        }
        MotivoAnulacion other = (MotivoAnulacion) object;
        if ((this.idmotanu == null && other.idmotanu != null) || (this.idmotanu != null && !this.idmotanu.equals(other.idmotanu))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnommotivo;
    }
}
