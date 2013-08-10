package com.zarcillo.domain;

import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "existencia")
@NamedQueries({
    @NamedQuery(name = "Existencia.findAll", query = "SELECT e FROM Existencia e"),
    @NamedQuery(name = "Existencia.findByIdalmacenByIdlineaByNstock", query = "SELECT e FROM Existencia e WHERE e.idalmacen.idalmacen=:idalmacen and e.idproducto.idsublinea.idlinea.idlinea in (:lista) and e.nstock>0 ORDER BY e.idproducto.idsublinea.idlinea.idlinea,e.idproducto.cnomproducto "),
    @NamedQuery(name = "Existencia.findByIdalmacenByIdlinea", query = "SELECT e FROM Existencia e WHERE e.idalmacen.idalmacen=:idalmacen and e.idproducto.idsublinea.idlinea.idlinea=:idlinea ORDER BY e.idproducto.cnomproducto "),
    @NamedQuery(name = "Existencia.findByIdalmacenByBinafecto", query = "SELECT e FROM Existencia e WHERE e.idalmacen.idalmacen=:idalmacen and e.idproducto.binafecto=true ORDER BY e.idproducto.cnomproducto "),
    @NamedQuery(name = "Existencia.findByIdalmacenByCnomproducto", query = "SELECT e FROM Existencia e WHERE e.idalmacen.idalmacen=:idalmacen and e.idproducto.cnomproducto LIKE :ccriterio ORDER BY e.idproducto.cnomproducto "),
    @NamedQuery(name = "Existencia.findByIdalmacenByIdproducto", query = "SELECT e FROM Existencia e WHERE e.idalmacen.idalmacen=:idalmacen and e.idproducto.idproducto=:idproducto")
})
public class Existencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExistenciaPK existenciaPK;
    @Column(name = "nstock")
    private Integer nstock;
    
    @Column(name = "nstockm")
    private Integer nstockm;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ncosuni")
    private BigDecimal ncosuni;
    @Column(name = "nultcos")
    private BigDecimal nultcos;
    @Column(name = "nvalven")
    private BigDecimal nvalven;
    @Column(name = "nincremento")
    private BigDecimal nincremento;
    @Column(name = "bactivo")
    private Boolean bactivo;
    @Column(name = "cubicacion")
    private String cubicacion;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Almacen idalmacen;
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Producto idproducto;
    @Column(name = "ntemporal")
    private Integer ntemporal;
    @Column(name = "nminimo")
    private Integer nminimo;
    @Column(name = "nmaximo")
    private Integer nmaximo;
    
    

    public Existencia() {
        bactivo = false;
        ncosuni = new BigDecimal("0");
        nincremento = new BigDecimal("0");
        nstock = 0;
        nultcos = new BigDecimal("0");
        nvalven = new BigDecimal("0");
        ntemporal = 0;
        nminimo = 0;
        nmaximo = 0;
        nstockm=0;
    }

    public Existencia(ExistenciaPK existenciaPK) {
        this.existenciaPK = existenciaPK;
        bactivo = false;
        ncosuni = new BigDecimal("0");
        nincremento = new BigDecimal("0");
        nstock = 0;
        nultcos = new BigDecimal("0");
        nvalven = new BigDecimal("0");
        ntemporal = 0;
        nminimo = 0;
        nmaximo = 0;
        nstockm=0;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }
    
    
    

    public Existencia(Integer idalmacen, String idproducto) {
        this.existenciaPK = new ExistenciaPK(idalmacen, idproducto);
        bactivo = false;
        ncosuni = new BigDecimal("0");
        nincremento = new BigDecimal("0");
        nstock = 0;
        nultcos = new BigDecimal("0");
        nvalven = new BigDecimal("0");
        ntemporal = 0;
        nminimo = 0;
        nmaximo = 0;
    }

    public ExistenciaPK getExistenciaPK() {
        return existenciaPK;
    }

    public void setExistenciaPK(ExistenciaPK existenciaPK) {
        this.existenciaPK = existenciaPK;
    }

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNultcos() {
        return nultcos;
    }

    public void setNultcos(BigDecimal nultcos) {
        this.nultcos = nultcos;
    }

    public BigDecimal getNvalven() {
        return nvalven;
    }

    public void setNvalven(BigDecimal nvalven) {
        this.nvalven = nvalven;
    }

    public BigDecimal getNincremento() {
        return nincremento;
    }

    public void setNincremento(BigDecimal nincremento) {
        this.nincremento = nincremento;
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

    public String getCubicacion() {
        return cubicacion;
    }

    public void setCubicacion(String cubicacion) {
        this.cubicacion = cubicacion;
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }

    public Integer getNtemporal() {
        return ntemporal;
    }

    public void setNtemporal(Integer ntemporal) {
        this.ntemporal = ntemporal;
    }

    public Integer getNminimo() {
        return nminimo;
    }

    public void setNminimo(Integer nminimo) {
        this.nminimo = nminimo;
    }

    public Integer getNmaximo() {
        return nmaximo;
    }

    public void setNmaximo(Integer nmaximo) {
        this.nmaximo = nmaximo;
    }

    public BigDecimal getCostoTotal() {
        return this.ncosuni.multiply(new BigDecimal(this.nstock)).setScale(4, BigDecimal.ROUND_HALF_UP);
    }

    public BigDecimal getPrecioCosto(BigDecimal nmontoigv) {
        BigDecimal ncosto = this.ncosuni.multiply(new BigDecimal(this.nstock)).setScale(4, BigDecimal.ROUND_HALF_UP);
        return Igv.Importe(nmontoigv, ncosto);
    }

    public BigDecimal getDescuento(BigDecimal valven, BigDecimal ndescuento) {
        if (!Numero.isCero(ndescuento)) {
            valven = valven.multiply(Numero.cien.subtract(ndescuento));
            valven = valven.divide(Numero.cien);
        }
        return valven;
    }

    public BigDecimal getUtilidad(BigDecimal valven, BigDecimal ndescuento) {
        BigDecimal nutilidad = new BigDecimal("0");
        //si d1 es igual a 1 quiere decir q tienen descuentos
        if (!Numero.isCero(ndescuento)) {
            valven = valven.multiply(Numero.cien.subtract(ndescuento));
        }
        //calculo la utilidad, valor venta *(100/cosuni)-100
        if (Numero.isCero(this.ncosuni)) {
            return Numero.cien;
        }

        nutilidad = valven.multiply(Numero.cien.divide(this.getNcosuni(), 4, BigDecimal.ROUND_HALF_UP)).subtract(Numero.cien);
        return nutilidad.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public BigDecimal getUtilidad(Descuento descuento, BigDecimal costo) {
        // valor de venta y utilidad
        BigDecimal ndescuento = new BigDecimal("0");
        BigDecimal valven = new BigDecimal("0");
        BigDecimal utilidad = new BigDecimal("0");
        //si d1,d2,d3 son iguales a 1 quiere decir q tienen descuentos
        if (!Numero.isCero(descuento.getNdesc1())) {
            ndescuento = descuento.getNdesc1();
        }

        if (!Numero.isCero(descuento.getNdesc2())) {
            ndescuento = descuento.getNdesc2();
        }

        if (!Numero.isCero(descuento.getNdesc3())) {
            ndescuento = descuento.getNdesc3();
        }

        if (!Numero.isCero(descuento.getNdesc4())) {
            ndescuento = descuento.getNdesc4();
        }

        BigDecimal porcentaje = (Numero.cien.subtract(ndescuento)).divide(Numero.cien);

        valven = valven.multiply(porcentaje);

        //calculo la utilidad, valor venta *(100/cosuni)-100
        if (Numero.isCero(costo)) {
            return Numero.cien;
        }

        utilidad = valven.multiply(Numero.cien.divide(costo, 4, BigDecimal.ROUND_HALF_UP)).subtract(Numero.cien);
        return utilidad.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (existenciaPK != null ? existenciaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Existencia)) {
            return false;
        }
        Existencia other = (Existencia) object;
        if ((this.existenciaPK == null && other.existenciaPK != null) || (this.existenciaPK != null && !this.existenciaPK.equals(other.existenciaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return existenciaPK.getIdproducto();
    }
}
