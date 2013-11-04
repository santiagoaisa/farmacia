package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "historico.historico_existencia")
@NamedQueries({
    @NamedQuery(name = "HistoricoExistencia.findAll", query = "SELECT h FROM HistoricoExistencia h"),
    @NamedQuery(name = "HistoricoExistencia.findByIdperiodoByIdalmacenByIdlinea", query = "SELECT h FROM HistoricoExistencia h WHERE h.idperiodo.idperiodo=:idperiodo and h.idalmacen.idalmacen=:idalmacen and h.idproducto.idsublinea.idlinea.idlinea=:idlinea ORDER BY h.idproducto.idsublinea.idlinea.cnomlinea, h.idproducto.idproducto ")
})
public class HistoricoExistencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Almacen idalmacen;
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(fetch = FetchType.EAGER)
    private Producto idproducto;
    @Column(name = "nstock")
    private Integer nstock;
    @Column(name = "nstockm")
    private Integer nstockm;
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
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "nminimo")
    private Integer nminimo;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;

    public HistoricoExistencia() {
        ncosuni = new BigDecimal("0");
        nincremento = new BigDecimal("0");
        nminimo = 0;
        nstock = 0;
        nstockm = 0;
        nultcos = new BigDecimal("0");
        nvalven = new BigDecimal("0");
    }

    public HistoricoExistencia(Integer id) {
        this.id = id;
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

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
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

    public Integer getNminimo() {
        return nminimo;
    }

    public void setNminimo(Integer nminimo) {
        this.nminimo = nminimo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HistoricoExistencia)) {
            return false;
        }
        HistoricoExistencia other = (HistoricoExistencia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.HistoricoExistencia[ id=" + id + " ]";
    }
}
