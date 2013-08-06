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
@Table(name = "amortizacion_proveedor")
@NamedQueries({
    @NamedQuery(name = "AmortizacionProveedor.findAll", query = "SELECT a FROM AmortizacionProveedor a"),
    @NamedQuery(name = "AmortizacionProveedor.findByIddeposito", query = "SELECT a FROM AmortizacionProveedor a WHERE a.iddeposito.iddeposito=:iddeposito"),
    @NamedQuery(name = "AmortizacionProveedor.findByIdcheque", query = "SELECT a FROM AmortizacionProveedor a WHERE a.idcheque.idcheque=:idcheque"),
    @NamedQuery(name = "AmortizacionProveedor.findByIdcuenta", query = "SELECT a FROM AmortizacionProveedor a WHERE a.idcuenta.idcuenta=:idcuenta "),
    @NamedQuery(name = "AmortizacionProveedor.findByIdnotabo", query = "SELECT a FROM AmortizacionProveedor a WHERE a.idnotabo.idnotabo=:idnotabo "),
    @NamedQuery(name = "AmortizacionProveedor.findByIdnotcar", query = "SELECT a FROM AmortizacionProveedor a WHERE a.idnotcar.idnotcar=:idnotcar ")
        
})
public class AmortizacionProveedor implements Serializable {
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
    
     @JoinColumn(name = "idbanco", referencedColumnName = "idbanco")
    @ManyToOne(fetch = FetchType.EAGER)
    private Banco idbanco;
     
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
    
    
    @JoinColumn(name = "idcuenta", referencedColumnName = "idcuenta")
    @ManyToOne(fetch = FetchType.EAGER)
    private CuentaPagar idcuenta;
   
    @JoinColumn(name = "idletra", referencedColumnName = "idletra")
    @ManyToOne(fetch = FetchType.EAGER)
    private LetraProveedor idletra;
    
     @JoinColumn(name = "idnotabo", referencedColumnName = "idnotabo")
    @ManyToOne(fetch = FetchType.EAGER)
    private NotaboProveedor idnotabo;
    
    @JoinColumn(name = "idnotcar", referencedColumnName = "idnotcar")
    @ManyToOne(fetch = FetchType.EAGER)
    private NotcarProveedor idnotcar;
    
     @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    
     @JoinColumn(name = "idcheque", referencedColumnName = "idcheque")
    @ManyToOne(fetch = FetchType.EAGER)
    private ChequeProveedor idcheque;
     
      @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
   
       @Column(name = "creferencia")
    private String creferencia;
       
          @JoinColumn(name = "iddeposito", referencedColumnName = "iddeposito")
    @ManyToOne(fetch = FetchType.EAGER)
    private DepositoProveedor iddeposito;

    public AmortizacionProveedor() {
        nimporte=new BigDecimal("0");
        nimportes=new BigDecimal("0");
        ntipocambio=new BigDecimal("1");
        
    }

    public AmortizacionProveedor(Integer idamortizacion) {
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

    public NotcarProveedor getIdnotcar() {
        return idnotcar;
    }

    public void setIdnotcar(NotcarProveedor idnotcar) {
        this.idnotcar = idnotcar;
    }

    public NotaboProveedor getIdnotabo() {
        return idnotabo;
    }

    public void setIdnotabo(NotaboProveedor idnotabo) {
        this.idnotabo = idnotabo;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public Banco getIdbanco() {
        return idbanco;
    }

    public void setIdbanco(Banco idbanco) {
        this.idbanco = idbanco;
    }

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public CuentaPagar getIdcuenta() {
        return idcuenta;
    }

    public void setIdcuenta(CuentaPagar idcuenta) {
        this.idcuenta = idcuenta;
    }

    public LetraProveedor getIdletra() {
        return idletra;
    }

    public void setIdletra(LetraProveedor idletra) {
        this.idletra = idletra;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public ChequeProveedor getIdcheque() {
        return idcheque;
    }

    public void setIdcheque(ChequeProveedor idcheque) {
        this.idcheque = idcheque;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    public String getCreferencia() {
        return creferencia;
    }

    public void setCreferencia(String creferencia) {
        this.creferencia = creferencia;
    }

    public DepositoProveedor getIddeposito() {
        return iddeposito;
    }

    public void setIddeposito(DepositoProveedor iddeposito) {
        this.iddeposito = iddeposito;
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
        if (!(object instanceof AmortizacionProveedor)) {
            return false;
        }
        AmortizacionProveedor other = (AmortizacionProveedor) object;
        if ((this.idamortizacion == null && other.idamortizacion != null) || (this.idamortizacion != null && !this.idamortizacion.equals(other.idamortizacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.AmortizacionProveedor[ idamortizacion=" + idamortizacion + " ]";
    }
    
}
