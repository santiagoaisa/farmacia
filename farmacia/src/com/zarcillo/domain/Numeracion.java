package com.zarcillo.domain;

import java.io.Serializable;
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

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "numeracion")
@NamedQueries({
    @NamedQuery(name = "Numeracion.findAll", query = "SELECT n FROM Numeracion n"),
    @NamedQuery(name = "Numeracion.findByIdnumeracion", query = "SELECT n FROM Numeracion n WHERE n.idnumeracion=:idnumeracion "),
    @NamedQuery(name = "Numeracion.findByIdunidadByIddocumento", query = "SELECT n FROM Numeracion n WHERE n.idunidad.idunidad=:idunidad and n.iddocumento.iddocumento=:iddocumento "),
    @NamedQuery(name = "Numeracion.findByIdunidadByIddocumentoByCserie", query = "SELECT n FROM Numeracion n WHERE n.idunidad.idunidad=:idunidad and n.iddocumento.iddocumento=:iddocumento and n.cserie=:cserie ")

})
public class Numeracion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idnumeracion")
    private Integer idnumeracion;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @Column(name = "cnomnumeracion")
    private String cnomnumeracion;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "nnumero")
    private Integer nnumero;
    @Column(name = "cimagen")
    private String cimagen;
    @Column(name = "creporte")
    private String creporte;
    @Column(name = "nitems")
    private Integer nitems;

    public Numeracion() {
        nitems = 0;
        nnumero = 0;
    }

    public Numeracion(Integer idnumeracion) {
        this.idnumeracion = idnumeracion;
    }

    public Integer getIdnumeracion() {
        return idnumeracion;
    }

    public void setIdnumeracion(Integer idnumeracion) {
        this.idnumeracion = idnumeracion;
    }

    public String getCnomnumeracion() {
        return cnomnumeracion;
    }

    public void setCnomnumeracion(String cnomnumeracion) {
        this.cnomnumeracion = cnomnumeracion;
    }

    public String getCserie() {
        return cserie;
    }

    public void setCserie(String cserie) {
        this.cserie = cserie;
    }

    public Integer getNnumero() {
        return nnumero;
    }

    public void setNnumero(Integer nnumero) {
        this.nnumero = nnumero;
    }

    public String getCimagen() {
        return cimagen;
    }

    public void setCimagen(String cimagen) {
        this.cimagen = cimagen;
    }

    public String getCreporte() {
        return creporte;
    }

    public void setCreporte(String creporte) {
        this.creporte = creporte;
    }

    public Integer getNitems() {
        return nitems;
    }

    public void setNitems(Integer nitems) {
        this.nitems = nitems;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }
    
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idnumeracion != null ? idnumeracion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Numeracion)) {
            return false;
        }
        Numeracion other = (Numeracion) object;
        if ((this.idnumeracion == null && other.idnumeracion != null) || (this.idnumeracion != null && !this.idnumeracion.equals(other.idnumeracion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.Numeracion[ idnumeracion=" + idnumeracion + " ]";
    }
}
