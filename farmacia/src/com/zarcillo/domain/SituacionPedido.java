package com.zarcillo.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "situacion_pedido")
@NamedQueries({
    @NamedQuery(name = "SituacionPedido.findAll", query = "SELECT s FROM SituacionPedido s")})
public class SituacionPedido implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idsituacion")
    private String idsituacion;
    @Column(name = "cnomsituacion")
    private String cnomsituacion;
    @Column(name = "nescala")
    private Integer nescala;

    public static SituacionPedido DIGITADO = new SituacionPedido("001");
    public static SituacionPedido IMPRESO = new SituacionPedido("002");
    public static SituacionPedido ENTREGADO = new SituacionPedido("003");
    
    
    public SituacionPedido() {
        nescala=0;
    }

    public SituacionPedido(String idsituacion) {
        this.idsituacion = idsituacion;
    }

    public String getIdsituacion() {
        return idsituacion;
    }

    public void setIdsituacion(String idsituacion) {
        this.idsituacion = idsituacion;
    }

    public String getCnomsituacion() {
        return cnomsituacion;
    }

    public void setCnomsituacion(String cnomsituacion) {
        this.cnomsituacion = cnomsituacion;
    }

    public Integer getNescala() {
        return nescala;
    }

    public void setNescala(Integer nescala) {
        this.nescala = nescala;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsituacion != null ? idsituacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SituacionPedido)) {
            return false;
        }
        SituacionPedido other = (SituacionPedido) object;
        if ((this.idsituacion == null && other.idsituacion != null) || (this.idsituacion != null && !this.idsituacion.equals(other.idsituacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.SituacionPedido[ idsituacion=" + idsituacion + " ]";
    }
    
}
