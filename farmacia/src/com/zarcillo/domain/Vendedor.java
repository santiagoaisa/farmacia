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
@Table(name = "log.vendedor")
@NamedQueries({
    @NamedQuery(name = "Vendedor.findAll", query = "SELECT v FROM Vendedor v"),
    @NamedQuery(name = "Vendedor.findByIdvendedor", query = "SELECT v FROM Vendedor v WHERE v.idvendedor=:idvendedor")
})
public class Vendedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idvendedor")
    private Integer idvendedor;
    @Column(name = "cnomvendedor")
    private String cnomvendedor;
    @Column(name = "cabrev")
    private String cabrev;
    @JoinColumn(name = "idubigeo", referencedColumnName = "idubigeo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Ubigeo idubigeo;
    @Column(name = "cdireccion")
    private String cdireccion;
    @Column(name = "ctelefono")
    private String ctelefono;
    @Column(name = "cmovil")
    private String cmovil;
    @Column(name = "bactivo")
    private Boolean bactivo;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;

    public Vendedor() {
        bactivo = false;

    }

    public Vendedor(Integer idvendedor) {
        this.idvendedor = idvendedor;
    }

    public Integer getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Integer idvendedor) {
        this.idvendedor = idvendedor;
    }

    public String getCnomvendedor() {
        return cnomvendedor;
    }

    public void setCnomvendedor(String cnomvendedor) {
        this.cnomvendedor = cnomvendedor;
    }

    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
    }

    public Ubigeo getIdubigeo() {
        return idubigeo;
    }

    public void setIdubigeo(Ubigeo idubigeo) {
        this.idubigeo = idubigeo;
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

    public String getCmovil() {
        return cmovil;
    }

    public void setCmovil(String cmovil) {
        this.cmovil = cmovil;
    }

    public Boolean getBactivo() {
        return bactivo;
    }

    public void setBactivo(Boolean bactivo) {
        this.bactivo = bactivo;
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
        hash += (idvendedor != null ? idvendedor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vendedor)) {
            return false;
        }
        Vendedor other = (Vendedor) object;
        if ((this.idvendedor == null && other.idvendedor != null) || (this.idvendedor != null && !this.idvendedor.equals(other.idvendedor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomvendedor;
    }
}
