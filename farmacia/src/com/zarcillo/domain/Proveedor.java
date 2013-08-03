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
@Table(name = "proveedor")
@NamedQueries({
    @NamedQuery(name = "Proveedor.findAll", query = "SELECT p FROM Proveedor p ORDER BY p.cnomprovee"),
    @NamedQuery(name = "Proveedor.findByCnomprovee", query = "SELECT p FROM Proveedor p WHERE p.cnomprovee LIKE :ccriterio ORDER BY p.cnomprovee "),
    @NamedQuery(name = "Proveedor.findByIdproveedor", query = "SELECT p FROM Proveedor p WHERE p.idproveedor=:idproveedor ")})
public class Proveedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idproveedor")
    private Integer idproveedor;
    @Column(name = "cnomprovee")
    private String cnomprovee;
    @Column(name = "cruc")
    private String cruc;
    @Column(name = "cdireccion")
    private String cdireccion;
    @Column(name = "ctelefono")
    private String ctelefono;
    @Column(name = "cfax")
    private String cfax;
    @Column(name = "cmovil")
    private String cmovil;
    @Column(name = "ccorreo")
    private String ccorreo;
    @Column(name = "curl")
    private String curl;
    @Column(name = "cobservacion")
    private String cobservacion;
    @Column(name = "bretencion")
    private Boolean bretencion;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idubigeo", referencedColumnName = "idubigeo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Ubigeo idubigeo;

    public Proveedor() {
        bretencion = false;
    }

    public Proveedor(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }

    public Integer getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getCnomprovee() {
        return cnomprovee;
    }

    public void setCnomprovee(String cnomprovee) {
        this.cnomprovee = cnomprovee;
    }

    public String getCruc() {
        return cruc;
    }

    public void setCruc(String cruc) {
        this.cruc = cruc;
    }

    public String getCdireccion() {
        return cdireccion;
    }

    public void setCdireccion(String cdireccion) {
        this.cdireccion = cdireccion;
    }

    public String getCtelefono() {
        return ctelefono;
    }

    public void setCtelefono(String ctelefono) {
        this.ctelefono = ctelefono;
    }

    public String getCfax() {
        return cfax;
    }

    public void setCfax(String cfax) {
        this.cfax = cfax;
    }

    public String getCmovil() {
        return cmovil;
    }

    public void setCmovil(String cmovil) {
        this.cmovil = cmovil;
    }

    public String getCcorreo() {
        return ccorreo;
    }

    public void setCcorreo(String ccorreo) {
        this.ccorreo = ccorreo;
    }

    public String getCurl() {
        return curl;
    }

    public void setCurl(String curl) {
        this.curl = curl;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
    }

    public Boolean getBretencion() {
        return bretencion;
    }

    public void setBretencion(Boolean bretencion) {
        this.bretencion = bretencion;
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

    public Ubigeo getIdubigeo() {
        return idubigeo;
    }

    public void setIdubigeo(Ubigeo idubigeo) {
        this.idubigeo = idubigeo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproveedor != null ? idproveedor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proveedor)) {
            return false;
        }
        Proveedor other = (Proveedor) object;
        if ((this.idproveedor == null && other.idproveedor != null) || (this.idproveedor != null && !this.idproveedor.equals(other.idproveedor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomprovee;
    }
}
