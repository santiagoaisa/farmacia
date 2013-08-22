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
@Table(name = "letra_cliente")
@NamedQueries({
    @NamedQuery(name = "LetraCliente.findAll", query = "SELECT l FROM LetraCliente l"),
    @NamedQuery(name = "LetraCliente.findByDfechasPendientes", query = "SELECT l FROM LetraCliente l WHERE l.dfecven BETWEEN :dfecha1 and :dfecha2 and l.nsaldo>0 ORDER BY l.dfecven,l.cnumero "),
    @NamedQuery(name = "LetraCliente.findByIdletra", query = "SELECT l FROM LetraCliente l WHERE l.idletra=:idletra ")

})
public class LetraCliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idletra")
    private Integer idletra;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    @Column(name = "nplazo")
    private Integer nplazo;
    @Column(name = "dfecven")
    @Temporal(TemporalType.DATE)
    private Date dfecven;
    @Column(name = "dfecpro")
    @Temporal(TemporalType.DATE)
    private Date dfecpro;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nnotabo")
    private BigDecimal nnotabo;
    @Column(name = "nnotcar")
    private BigDecimal nnotcar;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "nprotesto")
    private BigDecimal nprotesto;
    @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;
    @JoinColumn(name = "idbanco", referencedColumnName = "idbanco")
    @ManyToOne(fetch = FetchType.EAGER)
    private Banco idbanco;
    @JoinColumn(name = "idaval", referencedColumnName = "idaval")
    @ManyToOne(fetch = FetchType.EAGER)
    private Aval idaval;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    
     @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;

    public LetraCliente() {
        nacuenta = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        nnotabo = new BigDecimal("0");
        nnotcar = new BigDecimal("0");
        nplazo = 0;
        nprotesto = new BigDecimal("0");
        nsaldo = new BigDecimal("0");
        ntipocambio= new BigDecimal("1");
    }

    public LetraCliente(Integer idletra) {
        this.idletra = idletra;
    }

    public Integer getIdletra() {
        return idletra;
    }

    public void setIdletra(Integer idletra) {
        this.idletra = idletra;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
    }

    public Integer getNplazo() {
        return nplazo;
    }

    public void setNplazo(Integer nplazo) {
        this.nplazo = nplazo;
    }

    public Date getDfecven() {
        return dfecven;
    }

    public void setDfecven(Date dfecven) {
        this.dfecven = dfecven;
    }

    public Date getDfecpro() {
        return dfecpro;
    }

    public void setDfecpro(Date dfecpro) {
        this.dfecpro = dfecpro;
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

    public BigDecimal getNnotabo() {
        return nnotabo;
    }

    public void setNnotabo(BigDecimal nnotabo) {
        this.nnotabo = nnotabo;
    }

    public BigDecimal getNnotcar() {
        return nnotcar;
    }

    public void setNnotcar(BigDecimal nnotcar) {
        this.nnotcar = nnotcar;
    }

    public BigDecimal getNsaldo() {
        return nsaldo;
    }

    public void setNsaldo(BigDecimal nsaldo) {
        this.nsaldo = nsaldo;
    }

    public BigDecimal getNprotesto() {
        return nprotesto;
    }

    public void setNprotesto(BigDecimal nprotesto) {
        this.nprotesto = nprotesto;
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

    public Vendedor getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Vendedor idvendedor) {
        this.idvendedor = idvendedor;
    }

    public Aval getIdaval() {
        return idaval;
    }

    public void setIdaval(Aval idaval) {
        this.idaval = idaval;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
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

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
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
        hash += (idletra != null ? idletra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LetraCliente)) {
            return false;
        }
        LetraCliente other = (LetraCliente) object;
        if ((this.idletra == null && other.idletra != null) || (this.idletra != null && !this.idletra.equals(other.idletra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.LetraCliente[ idletra=" + idletra + " ]";
    }
}
