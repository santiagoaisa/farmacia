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
import javax.persistence.JoinColumns;
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
@Table(name = "lote")
@NamedQueries({
    @NamedQuery(name = "Lote.findAll", query = "SELECT l FROM Lote l"),
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByVentaEntero", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.nstock>0 and l.bbloqueado=false ORDER BY l.cfecven,l.clote "),    
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByVentaFraccion", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.nstockm>0 and l.bbloqueado=false ORDER BY l.cfecven,l.clote "),    
    
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByCloteByIngreso", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.clote=:clote and l.bbloqueado=false and l.nstock>=0 "),    
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByCloteByAnulacion", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.clote=:clote and l.nstock>=0 "),
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByCloteByVenta", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.nstock>0 and l.bbloqueado=false  "),    
    @NamedQuery(name = "Lote.findByIdalmacenByIdproductoByListado", query = "SELECT l FROM Lote l WHERE  l.idalmacen.idalmacen=:idalmacen and l.idproducto.idproducto = :idproducto and l.nstock>0 ORDER BY l.cfecven,l.clote ")

})
public class Lote implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlote")
    private Integer idlote;
    @Column(name = "clote")
    private String clote;
    @Column(name = "nstock")
    private Integer nstock;
    
    @Column(name = "nstockm")
    private Integer nstockm;
    
    @Column(name = "cfecven")
    private String cfecven;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoEntrada idmotivo;
    
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Almacen idalmacen;
    
    @JoinColumn(name = "idproducto", referencedColumnName = "idproducto")
    @ManyToOne(fetch = FetchType.EAGER)
    private Producto idproducto;
    
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    @Column(name = "bbloqueado")
    private Boolean bbloqueado;
    @Column(name = "cobservacion")
    private String cobservacion;
    

    public Lote() {
        nstock = 0;
        bbloqueado = false;
        nstockm=0;
    }

    public Lote(Integer idlote) {
        this.idlote = idlote;
    }

    public Integer getIdlote() {
        return idlote;
    }

    public void setIdlote(Integer idlote) {
        this.idlote = idlote;
    }

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public String getCfecven() {
        return cfecven;
    }

    public void setCfecven(String cfecven) {
        this.cfecven = cfecven;
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

    public MotivoEntrada getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoEntrada idmotivo) {
        this.idmotivo = idmotivo;
    }

   
    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public Boolean getBbloqueado() {
        return bbloqueado;
    }

    public void setBbloqueado(Boolean bbloqueado) {
        this.bbloqueado = bbloqueado;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
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

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    
    
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlote != null ? idlote.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lote)) {
            return false;
        }
        Lote other = (Lote) object;
        if ((this.idlote == null && other.idlote != null) || (this.idlote != null && !this.idlote.equals(other.idlote))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return clote;
    }
}
