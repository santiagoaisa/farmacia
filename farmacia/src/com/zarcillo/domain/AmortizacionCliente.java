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
@Table(name = "amortizacion_cliente")
@NamedQueries({
    @NamedQuery(name = "AmortizacionCliente.findAll", query = "SELECT a FROM AmortizacionCliente a")})
public class AmortizacionCliente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idamortizacion")
    private Integer idamortizacion;
    
     @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    
      @JoinColumn(name = "idtipo", referencedColumnName = "idtipo")
    @ManyToOne(fetch = FetchType.EAGER)
    private TipoPago idtipo;
     
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
   
    @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;   
    
     @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;   
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    @Column(name = "nimportes")
    private BigDecimal nimportes;
    
    
    @JoinColumn(name = "idcomprobante", referencedColumnName = "idcomprobante")
    @ManyToOne(fetch = FetchType.EAGER)
    private ComprobanteEmitido idcomprobante;
    
     @JoinColumn(name = "idletra", referencedColumnName = "idletra")
    @ManyToOne(fetch = FetchType.EAGER)
    private LetraCliente idletra;
     
      @JoinColumn(name = "idnotabo", referencedColumnName = "idnotabo")
    @ManyToOne(fetch = FetchType.EAGER)
    private NotaboCliente idnotabo;
    
    @JoinColumn(name = "idnotcar", referencedColumnName = "idnotcar")
    @ManyToOne(fetch = FetchType.EAGER)
    private NotcarCliente idnotcar;
   
   @Column(name = "bregistro")
    private Boolean bregistro;
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public AmortizacionCliente() {
        bregistro=false;
        nimporte=new BigDecimal("0");
        ntipocambio=new BigDecimal("0");
        nimportes=new BigDecimal("0");
    }

    public AmortizacionCliente(Integer idamortizacion) {
        this.idamortizacion = idamortizacion;
    }

    public Integer getIdamortizacion() {
        return idamortizacion;
    }

    public void setIdamortizacion(Integer idamortizacion) {
        this.idamortizacion = idamortizacion;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

  

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public BigDecimal getNtipocambio() {
        return ntipocambio;
    }

    public void setNtipocambio(BigDecimal ntipocambio) {
        this.ntipocambio = ntipocambio;
    }

    public BigDecimal getNimportes() {
        return nimportes;
    }

    public void setNimportes(BigDecimal nimportes) {
        this.nimportes = nimportes;
    }

    public Boolean getBregistro() {
        return bregistro;
    }

    public void setBregistro(Boolean bregistro) {
        this.bregistro = bregistro;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public TipoPago getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(TipoPago idtipo) {
        this.idtipo = idtipo;
    }

    public NotcarCliente getIdnotcar() {
        return idnotcar;
    }

    public void setIdnotcar(NotcarCliente idnotcar) {
        this.idnotcar = idnotcar;
    }

    public NotaboCliente getIdnotabo() {
        return idnotabo;
    }

    public void setIdnotabo(NotaboCliente idnotabo) {
        this.idnotabo = idnotabo;
    }

    public LetraCliente getIdletra() {
        return idletra;
    }

    public void setIdletra(LetraCliente idletra) {
        this.idletra = idletra;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public Vendedor getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Vendedor idvendedor) {
        this.idvendedor = idvendedor;
    }

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public ComprobanteEmitido getIdcomprobante() {
        return idcomprobante;
    }

    public void setIdcomprobante(ComprobanteEmitido idcomprobante) {
        this.idcomprobante = idcomprobante;
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
        hash += (idamortizacion != null ? idamortizacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AmortizacionCliente)) {
            return false;
        }
        AmortizacionCliente other = (AmortizacionCliente) object;
        if ((this.idamortizacion == null && other.idamortizacion != null) || (this.idamortizacion != null && !this.idamortizacion.equals(other.idamortizacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.AmortizacionCliente[ idamortizacion=" + idamortizacion + " ]";
    }
    
}
