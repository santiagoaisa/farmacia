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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "mapa")
@NamedQueries({
    @NamedQuery(name = "Mapa.findAll", query = "SELECT m FROM Mapa m"),
    @NamedQuery(name = "Mapa.findByIdrolByIdmoduloByNnivel1", query = "SELECT m FROM Mapa m WHERE m.idrol.idrol = :idrol and m.idmenu.idmodulo.idmodulo=:idmodulo and m.idmenu.nnivel1=:nnivel1  ORDER BY m.idmenu.norden "),
    @NamedQuery(name = "Mapa.findByIdrolByIdmodulo", query = "SELECT m FROM Mapa m WHERE m.idrol.idrol = :idrol and m.idmenu.idmodulo.idmodulo=:idmodulo   ORDER BY m.idmenu.norden ")
})
public class Mapa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmapa")
    private Integer idmapa;
    @JoinColumn(name = "idrol", referencedColumnName = "idrol")
    @ManyToOne(fetch = FetchType.EAGER)
    private Rol idrol;
    @JoinColumn(name = "idmenu", referencedColumnName = "idmenu")
    @ManyToOne(fetch = FetchType.EAGER)
    private Menu idmenu;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public Mapa() {
    }

    public Mapa(Integer idmapa) {
        this.idmapa = idmapa;
    }

    public Integer getIdmapa() {
        return idmapa;
    }

    public void setIdmapa(Integer idmapa) {
        this.idmapa = idmapa;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Menu getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(Menu idmenu) {
        this.idmenu = idmenu;
    }

    public Rol getIdrol() {
        return idrol;
    }

    public void setIdrol(Rol idrol) {
        this.idrol = idrol;
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
        hash += (idmapa != null ? idmapa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mapa)) {
            return false;
        }
        Mapa other = (Mapa) object;
        if ((this.idmapa == null && other.idmapa != null) || (this.idmapa != null && !this.idmapa.equals(other.idmapa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.Mapa[ idmapa=" + idmapa + " ]";
    }
}
