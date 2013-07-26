package com.zarcillo.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author saisa
 */
@Embeddable
public class ExistenciaPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "idalmacen")
    private int idalmacen;
    @Basic(optional = false)
    @Column(name = "idproducto")
    private String idproducto;

    public ExistenciaPK() {
    }

    public ExistenciaPK(int idalmacen, String idproducto) {
        this.idalmacen = idalmacen;
        this.idproducto = idproducto;
    }

    public int getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(int idalmacen) {
        this.idalmacen = idalmacen;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idalmacen;
        hash += (idproducto != null ? idproducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExistenciaPK)) {
            return false;
        }
        ExistenciaPK other = (ExistenciaPK) object;
        if (this.idalmacen != other.idalmacen) {
            return false;
        }
        if ((this.idproducto == null && other.idproducto != null) || (this.idproducto != null && !this.idproducto.equals(other.idproducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.ExistenciaPK[ idalmacen=" + idalmacen + ", idproducto=" + idproducto + " ]";
    }
    
}
