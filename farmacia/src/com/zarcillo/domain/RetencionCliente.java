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
@Table(name = "retencion_cliente")
@NamedQueries({
    @NamedQuery(name = "RetencionCliente.findAll", query = "SELECT r FROM RetencionCliente r"),
    @NamedQuery(name = "RetencionCliente.findByIdretencion", query = "SELECT r FROM RetencionCliente r WHERE r.idretencion=:idretencion "),
    @NamedQuery(name = "RetencionCliente.findByIdunidadByCserieByCnumero", query = "SELECT r FROM RetencionCliente r WHERE r.idunidad.idunidad=:idunidad and r.cserie=:cserie and r.cnumero=:cnumero  "),
    @NamedQuery(name = "RetencionCliente.findByIdunidadByIdclienteByNano", query = "SELECT r FROM RetencionCliente r WHERE r.idunidad.idunidad=:idunidad and r.idcliente.idcliente=:idcliente and r.idperiodo.nano=:nano  ORDER BY r.dfecemi DESC "),
    @NamedQuery(name = "RetencionCliente.findByIdunidadByIdperiodo", query = "SELECT r FROM RetencionCliente r WHERE r.idunidad.idunidad=:idunidad and r.idperiodo.idperiodo=:idperiodo ORDER BY r.dfecemi DESC ")
})
public class RetencionCliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idretencion")
    private Integer idretencion;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
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
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    
     @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;

    public RetencionCliente() {
        nacuenta = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        nsaldo = new BigDecimal("0");
        ntipocambio = new BigDecimal("1");
    }

    public RetencionCliente(Integer idretencion) {
        this.idretencion = idretencion;
    }

    public Integer getIdretencion() {
        return idretencion;
    }

    public void setIdretencion(Integer idretencion) {
        this.idretencion = idretencion;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
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

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Date getDfeccan() {
        return dfeccan;
    }

    public void setDfeccan(Date dfeccan) {
        this.dfeccan = dfeccan;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idretencion != null ? idretencion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RetencionCliente)) {
            return false;
        }
        RetencionCliente other = (RetencionCliente) object;
        if ((this.idretencion == null && other.idretencion != null) || (this.idretencion != null && !this.idretencion.equals(other.idretencion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cserie + "-" + cnumero;
    }
}
