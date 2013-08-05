package com.zarcillo.domain;

import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "descuento")
@NamedQueries({
    @NamedQuery(name = "Descuento.findAll", query = "SELECT d FROM Descuento d"),
    @NamedQuery(name = "Descuento.findByIdalmacenByIdproducto", query = "SELECT d FROM Descuento d WHERE d.existencia.idalmacen.idalmacen=:idalmacen and d.existencia.idproducto.idproducto=:idproducto ")
})
public class Descuento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddescuento")
    private Integer iddescuento;
    @JoinColumns({
        @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen"),
        @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")})
    @ManyToOne(fetch = FetchType.EAGER)
    private Existencia existencia;
    @Column(name = "nbon1")
    private Integer nbon1;
    @Column(name = "nbon2")
    private Integer nbon2;
    @Column(name = "ncant1")
    private Integer ncant1;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ndesc1")
    private BigDecimal ndesc1;
    @Column(name = "ncant2")
    private Integer ncant2;
    @Column(name = "ndesc2")
    private BigDecimal ndesc2;
    @Column(name = "ncant3")
    private Integer ncant3;
    @Column(name = "ndesc3")
    private BigDecimal ndesc3;
    @Column(name = "ncant4")
    private Integer ncant4;
    @Column(name = "ndesc4")
    private BigDecimal ndesc4;

    public Descuento() {
        nbon1 = 0;
        nbon2 = 0;
        ncant1 = 0;
        ncant2 = 0;
        ncant3 = 0;
        ncant4 = 0;
        ndesc1 = new BigDecimal("0");
        ndesc2 = new BigDecimal("0");
        ndesc3 = new BigDecimal("0");
        ndesc4 = new BigDecimal("0");
    }

    public Descuento(Integer idalmacen, String idproducto) {
        this.existencia = new Existencia(idalmacen, idproducto);
        nbon1 = 0;
        nbon2 = 0;
        ncant1 = 0;
        ncant2 = 0;
        ncant3 = 0;
        ncant4 = 0;
        ndesc1 = new BigDecimal("0");
        ndesc2 = new BigDecimal("0");
        ndesc3 = new BigDecimal("0");
        ndesc4 = new BigDecimal("0");
    }

    public Descuento(Integer iddescuento) {
        this.iddescuento = iddescuento;
    }

    public Integer getIddescuento() {
        return iddescuento;
    }

    public Existencia getExistencia() {
        return existencia;
    }

    public void setExistencia(Existencia existencia) {
        this.existencia = existencia;
    }

    public void setIddescuento(Integer iddescuento) {
        this.iddescuento = iddescuento;
    }

    public Integer getNbon1() {
        return nbon1;
    }

    public void setNbon1(Integer nbon1) {
        this.nbon1 = nbon1;
    }

    public Integer getNbon2() {
        return nbon2;
    }

    public void setNbon2(Integer nbon2) {
        this.nbon2 = nbon2;
    }

    public Integer getNcant1() {
        return ncant1;
    }

    public void setNcant1(Integer ncant1) {
        this.ncant1 = ncant1;
    }

    public BigDecimal getNdesc1() {
        return ndesc1;
    }

    public void setNdesc1(BigDecimal ndesc1) {
        this.ndesc1 = ndesc1;
    }

    public Integer getNcant2() {
        return ncant2;
    }

    public void setNcant2(Integer ncant2) {
        this.ncant2 = ncant2;
    }

    public BigDecimal getNdesc2() {
        return ndesc2;
    }

    public void setNdesc2(BigDecimal ndesc2) {
        this.ndesc2 = ndesc2;
    }

    public Integer getNcant3() {
        return ncant3;
    }

    public void setNcant3(Integer ncant3) {
        this.ncant3 = ncant3;
    }

    public BigDecimal getNdesc3() {
        return ndesc3;
    }

    public void setNdesc3(BigDecimal ndesc3) {
        this.ndesc3 = ndesc3;
    }

    public Integer getNcant4() {
        return ncant4;
    }

    public void setNcant4(Integer ncant4) {
        this.ncant4 = ncant4;
    }

    public BigDecimal getNdesc4() {
        return ndesc4;
    }

    public void setNdesc4(BigDecimal ndesc4) {
        this.ndesc4 = ndesc4;
    }

    public BigDecimal getDescuento() {        
        BigDecimal ndescuento = new BigDecimal("0");

        if (nbon1.equals(0) && nbon2.equals(0)) {
            return ndescuento;
        }

        ndescuento = Numero.cien.multiply(new BigDecimal(nbon2));
        ndescuento = ndescuento.divide(new BigDecimal(nbon1 + nbon2), 2, BigDecimal.ROUND_HALF_UP);

        return ndescuento.setScale(2, BigDecimal.ROUND_HALF_UP);
    }
    
     public BigDecimal getMayorDescuento() {        
        BigDecimal ndescuento = new BigDecimal("0");
        
        if (!Numero.isCero(this.ndesc1)) {
            ndescuento = this.getNdesc1();
        }

        if (!Numero.isCero(this.ndesc2)) {
            ndescuento = this.getNdesc2();
        }

        if (!Numero.isCero(this.ndesc3)) {
            ndescuento = this.getNdesc3();
        }

        if (!Numero.isCero(this.ndesc4)) {
            ndescuento = this.getNdesc4();
        }

        return ndescuento;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddescuento != null ? iddescuento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Descuento)) {
            return false;
        }
        Descuento other = (Descuento) object;
        if ((this.iddescuento == null && other.iddescuento != null) || (this.iddescuento != null && !this.iddescuento.equals(other.iddescuento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.Descuento[ iddescuento=" + iddescuento + " ]";
    }
}
