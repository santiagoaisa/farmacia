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
@Table(name = "motivo_entrada")
@NamedQueries({
    @NamedQuery(name = "MotivoEntrada.findAll", query = "SELECT m FROM MotivoEntrada m ORDER BY m.norden"),
    @NamedQuery(name = "MotivoEntrada.findByIdmotivo", query = "SELECT m FROM MotivoEntrada m WHERE m.idmotivo=:idmotivo")
})
public class MotivoEntrada implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmotivo")
    private Integer idmotivo;
    @Column(name = "cnommotivo")
    private String cnommotivo;
    @Column(name = "bcosteo")
    private Boolean bcosteo;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
     @Column(name = "bcompra")
    private Boolean bcompra;
    
     @Column(name = "norden")
    private Integer norden;
    
    public static MotivoEntrada TRANSFERENCIA=new MotivoEntrada(0,false);
    public static MotivoEntrada ANULACION=new MotivoEntrada(2,false);

    public MotivoEntrada() {
        bcosteo=false;        
        bcompra=false;
        norden=0;
    }

    public MotivoEntrada(Integer idmotivo) {
        this.idmotivo = idmotivo;
        bcosteo=false;        
        bcompra=false;
        norden=0;
    }

    public MotivoEntrada(Integer idmotivo, Boolean bcosteo) {
        this.idmotivo = idmotivo;
        this.bcosteo = bcosteo;
        bcompra=false;
        norden=0;
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

    

    public Boolean getBcosteo() {
        return bcosteo;
    }

    public void setBcosteo(Boolean bcosteo) {
        this.bcosteo = bcosteo;
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

    public Boolean getBcompra() {
        return bcompra;
    }

    public void setBcompra(Boolean bcompra) {
        this.bcompra = bcompra;
    }

    public Integer getNorden() {
        return norden;
    }

    public void setNorden(Integer norden) {
        this.norden = norden;
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
        if (!(object instanceof MotivoEntrada)) {
            return false;
        }
        MotivoEntrada other = (MotivoEntrada) object;
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
