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
@Table(name = "aval")
@NamedQueries({
    @NamedQuery(name = "Aval.findAll", query = "SELECT a FROM Aval a"),
    @NamedQuery(name = "Aval.findByIdaval", query = "SELECT a FROM Aval a WHERE a.idaval=:idaval"),
    @NamedQuery(name = "Aval.findByIdcliente", query = "SELECT a FROM Aval a WHERE a.idcliente.idcliente=:idcliente ORDER BY a.cnomaval")
})
public class Aval implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idaval")
    private Integer idaval;
    @Column(name = "cnomaval")
    private String cnomaval;
    @Column(name = "cdireccion")
    private String cdireccion;
    @Column(name = "cdni")
    private String cdni;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public Aval() {
    }

    public Aval(Integer idaval) {
        this.idaval = idaval;
    }

    public Integer getIdaval() {
        return idaval;
    }

    public void setIdaval(Integer idaval) {
        this.idaval = idaval;
    }

    public String getCnomaval() {
        return cnomaval;
    }

    public void setCnomaval(String cnomaval) {
        this.cnomaval = cnomaval;
    }

    public String getCdireccion() {
        return cdireccion;
    }

    public void setCdireccion(String cdireccion) {
        this.cdireccion = cdireccion;
    }

    public String getCdni() {
        return cdni;
    }

    public void setCdni(String cdni) {
        this.cdni = cdni;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
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
        hash += (idaval != null ? idaval.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aval)) {
            return false;
        }
        Aval other = (Aval) object;
        if ((this.idaval == null && other.idaval != null) || (this.idaval != null && !this.idaval.equals(other.idaval))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomaval;
    }
}
