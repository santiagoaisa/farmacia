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
@Table(name = "cheque_proveedor")
@NamedQueries({
    @NamedQuery(name = "ChequeProveedor.findAll", query = "SELECT c FROM ChequeProveedor c"),
    @NamedQuery(name = "ChequeProveedor.findByIdcheque", query = "SELECT c FROM ChequeProveedor c WHERE c.idcheque=:idcheque "),
    @NamedQuery(name = "ChequeProveedor.findByIdunidadByIdproveedorByNano", query = "SELECT c FROM ChequeProveedor c WHERE c.idunidad.idunidad=:idunidad and c.idproveedor.idproveedor=:idproveedor and c.idperiodo.nano=:nano ORDER BY c.dfecha DESC "),
    @NamedQuery(name = "ChequeProveedor.findByIdunidadByIdproveedorByNanoPendientes", query = "SELECT c FROM ChequeProveedor c WHERE c.idunidad.idunidad=:idunidad and c.idproveedor.idproveedor=:idproveedor and c.idperiodo.nano=:nano and c.nsaldo>0 ORDER BY c.dfecha DESC ")
})
public class ChequeProveedor implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcheque")
    private Integer idcheque;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    
     @JoinColumn(name = "idbanco", referencedColumnName = "idbanco")
    @ManyToOne(fetch = FetchType.EAGER)
    private Banco idbanco;
    
    @Column(name = "cnumero")
    private String cnumero;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;
    
     @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
     
      @JoinColumn(name = "idproveedor", referencedColumnName = "idproveedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Proveedor idproveedor;
      
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
     @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
     
    @Column(name = "cgirado")
    private String cgirado;

     @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
     
      @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    
    public ChequeProveedor() {
         nacuenta=new BigDecimal("0");
        nimporte=new BigDecimal("0");
        nsaldo=new BigDecimal("0");
        ntipocambio=new BigDecimal("1");
    }

    public ChequeProveedor(Integer idcheque) {
        this.idcheque = idcheque;
    }

    public Integer getIdcheque() {
        return idcheque;
    }

    public void setIdcheque(Integer idcheque) {
        this.idcheque = idcheque;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
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

    public Date getDfeccan() {
        return dfeccan;
    }

    public void setDfeccan(Date dfeccan) {
        this.dfeccan = dfeccan;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public String getCgirado() {
        return cgirado;
    }

    public void setCgirado(String cgirado) {
        this.cgirado = cgirado;
    }

    public Banco getIdbanco() {
        return idbanco;
    }

    public void setIdbanco(Banco idbanco) {
        this.idbanco = idbanco;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Proveedor getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Proveedor idproveedor) {
        this.idproveedor = idproveedor;
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

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public BigDecimal getNtipocambio() {
        return ntipocambio;
    }

    public void setNtipocambio(BigDecimal ntipocambio) {
        this.ntipocambio = ntipocambio;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcheque != null ? idcheque.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChequeProveedor)) {
            return false;
        }
        ChequeProveedor other = (ChequeProveedor) object;
        if ((this.idcheque == null && other.idcheque != null) || (this.idcheque != null && !this.idcheque.equals(other.idcheque))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnumero;
    }
    
}
