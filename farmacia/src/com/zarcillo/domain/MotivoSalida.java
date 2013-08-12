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
@Table(name = "motivo_salida")
@NamedQueries({
    @NamedQuery(name = "MotivoSalida.findAll", query = "SELECT m FROM MotivoSalida m ORDER BY m.cnommotivo"),
        @NamedQuery(name = "MotivoSalida.findByVenta", query = "SELECT m FROM MotivoSalida m WHERE m.bventa=true ORDER BY m.cnommotivo"),
    @NamedQuery(name = "MotivoSalida.findByIdmotivo", query = "SELECT m FROM MotivoSalida m WHERE m.idmotivo=:idmotivo")
})
public class MotivoSalida implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmotivo")
    private Integer idmotivo;
    @Column(name = "cnommotivo")
    private String cnommotivo;
    @Column(name = "bventa")
    private Boolean bventa;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;

    public static MotivoSalida TRANSFERENCIA=new MotivoSalida(0);
    
    public MotivoSalida() {
        bventa=false;
    }

    public MotivoSalida(Integer idmotivo) {
        this.idmotivo = idmotivo;
    }

    public Integer getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(Integer idmotivo) {
        this.idmotivo = idmotivo;
    }

    public String getCnommotivo() {
        return cnommotivo;
    }

    public void setCnommotivo(String cnommotivo) {
        this.cnommotivo = cnommotivo;
    }

    public Boolean getBventa() {
        return bventa;
    }

    public void setBventa(Boolean bventa) {
        this.bventa = bventa;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmotivo != null ? idmotivo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MotivoSalida)) {
            return false;
        }
        MotivoSalida other = (MotivoSalida) object;
        if ((this.idmotivo == null && other.idmotivo != null) || (this.idmotivo != null && !this.idmotivo.equals(other.idmotivo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnommotivo;
    }
    
}
