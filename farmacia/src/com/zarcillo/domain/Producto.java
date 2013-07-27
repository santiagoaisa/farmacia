package com.zarcillo.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "producto")
@NamedQueries({
    @NamedQuery(name = "Producto.findAll", query = "SELECT p FROM Producto p ORDER BY p.cnomproducto"),
    @NamedQuery(name = "Producto.findByIdproducto", query = "SELECT p FROM Producto p WHERE p.idproducto=:idproducto ")

})
public class Producto implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idproducto")
    private String idproducto;
    @Column(name = "cnomproducto")
    private String cnomproducto;
    @Column(name = "binafecto")
    private Boolean binafecto;
    @Column(name = "ccodigobarra")
    private String ccodigobarra;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idsublinea", referencedColumnName = "idsublinea")
    @ManyToOne(fetch = FetchType.EAGER)
    private Sublinea idsublinea;
    @JoinColumn(name = "idpresentacion", referencedColumnName = "idpresentacion")
    @ManyToOne(fetch = FetchType.EAGER)
    private Presentacion idpresentacion;
    @JoinColumn(name = "idfamilia", referencedColumnName = "idfamilia")
    @ManyToOne(fetch = FetchType.EAGER)
    private Familia idfamilia;

    public Producto() {
    }

    public Producto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getCnomproducto() {
        return cnomproducto;
    }

    public void setCnomproducto(String cnomproducto) {
        this.cnomproducto = cnomproducto;
    }

    public Boolean getBinafecto() {
        return binafecto;
    }

    public void setBinafecto(Boolean binafecto) {
        this.binafecto = binafecto;
    }

    public String getCcodigobarra() {
        return ccodigobarra;
    }

    public void setCcodigobarra(String ccodigobarra) {
        this.ccodigobarra = ccodigobarra;
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

    public Sublinea getIdsublinea() {
        return idsublinea;
    }

    public void setIdsublinea(Sublinea idsublinea) {
        this.idsublinea = idsublinea;
    }

    public Presentacion getIdpresentacion() {
        return idpresentacion;
    }

    public void setIdpresentacion(Presentacion idpresentacion) {
        this.idpresentacion = idpresentacion;
    }

    public Familia getIdfamilia() {
        return idfamilia;
    }

    public void setIdfamilia(Familia idfamilia) {
        this.idfamilia = idfamilia;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproducto != null ? idproducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.idproducto == null && other.idproducto != null) || (this.idproducto != null && !this.idproducto.equals(other.idproducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomproducto;
    }
    
}
