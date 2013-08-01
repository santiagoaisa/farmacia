package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "notabo_proveedor")
@NamedQueries({
    @NamedQuery(name = "NotaboProveedor.findAll", query = "SELECT n FROM NotaboProveedor n")})
public class NotaboProveedor implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idnotabo")
    private Integer idnotabo;
    
     @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
     
      @JoinColumn(name = "idproveedor", referencedColumnName = "idproveedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Proveedor idproveedor;
    
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    
     @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    
       @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    
      @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    
    @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoNotaboProveedor idmotivo;
    

    public NotaboProveedor() {
    }

    public NotaboProveedor(Integer idnotabo) {
        this.idnotabo = idnotabo;
    }

    public Integer getIdnotabo() {
        return idnotabo;
    }

    public void setIdnotabo(Integer idnotabo) {
        this.idnotabo = idnotabo;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
    }

    public BigDecimal getNafecto() {
        return nafecto;
    }

    public void setNafecto(BigDecimal nafecto) {
        this.nafecto = nafecto;
    }

    public BigDecimal getNinafecto() {
        return ninafecto;
    }

    public void setNinafecto(BigDecimal ninafecto) {
        this.ninafecto = ninafecto;
    }

    public BigDecimal getNigv() {
        return nigv;
    }

    public void setNigv(BigDecimal nigv) {
        this.nigv = nigv;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public BigDecimal getNacuenta() {
        return nacuenta;
    }

    public void setNacuenta(BigDecimal nacuenta) {
        this.nacuenta = nacuenta;
    }

    public BigDecimal getNsaldo() {
        return nsaldo;
    }

    public void setNsaldo(BigDecimal nsaldo) {
        this.nsaldo = nsaldo;
    }

    public BigDecimal getNtipocambio() {
        return ntipocambio;
    }

    public void setNtipocambio(BigDecimal ntipocambio) {
        this.ntipocambio = ntipocambio;
    }

    public String getCserie() {
        return cserie;
    }

    public void setCserie(String cserie) {
        this.cserie = cserie;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public MotivoNotaboProveedor getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoNotaboProveedor idmotivo) {
        this.idmotivo = idmotivo;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    public Proveedor getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Proveedor idproveedor) {
        this.idproveedor = idproveedor;
    }

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
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
        hash += (idnotabo != null ? idnotabo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotaboProveedor)) {
            return false;
        }
        NotaboProveedor other = (NotaboProveedor) object;
        if ((this.idnotabo == null && other.idnotabo != null) || (this.idnotabo != null && !this.idnotabo.equals(other.idnotabo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cserie+"-"+cnumero;
    }
    
}
