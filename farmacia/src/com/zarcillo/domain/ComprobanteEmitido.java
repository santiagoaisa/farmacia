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
@Table(name = "comprobante_emitido")
@NamedQueries({
    @NamedQuery(name = "ComprobanteEmitido.findAll", query = "SELECT c FROM ComprobanteEmitido c"),
    @NamedQuery(name = "ComprobanteEmitido.findByDfechasPendientes", query = "SELECT c FROM ComprobanteEmitido c WHERE c.dfecven BETWEEN :dfecha1 and :dfecha2 and c.nsaldo>0 ORDER BY c.dfecven,c.cnumero "),
    @NamedQuery(name = "ComprobanteEmitido.findByIdregsalida", query = "SELECT c FROM ComprobanteEmitido c WHERE c.idregsalida.idregsalida=:idregsalida "),
    @NamedQuery(name = "ComprobanteEmitido.findByIdcomprobante", query = "SELECT c FROM ComprobanteEmitido c WHERE c.idcomprobante=:idcomprobante"),
    @NamedQuery(name = "ComprobanteEmitido.findByIdunidadByIddocumentoByCserieByCnumero", query = "SELECT c FROM ComprobanteEmitido c WHERE c.idunidad.idunidad=:idunidad and c.iddocumento.iddocumento=:iddocumento and c.cserie=:cserie and c.cnumero=:cnumero  "),
    @NamedQuery(name = "ComprobanteEmitido.findByIdunidadByIdclienteByNano", query = "SELECT c FROM ComprobanteEmitido c WHERE c.idunidad.idunidad=:idunidad and c.idcliente.idcliente=:idcliente and c.idperiodo.nano =:nano ORDER BY c.dfecemi DESC  ")
})
public class ComprobanteEmitido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcomprobante")
    private Integer idcomprobante;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "csergui")
    private String csergui;
    @Column(name = "cnumgui")
    private String cnumgui;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    @Column(name = "nplazo")
    private Integer nplazo;
    @Column(name = "dfecven")
    @Temporal(TemporalType.DATE)
    private Date dfecven;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nredondeo")
    private BigDecimal nredondeo;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nnotabo")
    private BigDecimal nnotabo;
    @Column(name = "nnotcar")
    private BigDecimal nnotcar;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "ncosto")
    private BigDecimal ncosto;
    @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idregsalida", referencedColumnName = "idregsalida")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroSalida idregsalida;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @Column(name = "nfleven")
    private BigDecimal nfleven;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    @Column(name = "nretencion")
    private BigDecimal nretencion;

    public ComprobanteEmitido() {
        nacuenta = new BigDecimal("0");
        nafecto = new BigDecimal("0");
        ncosto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        nnotabo = new BigDecimal("0");
        nnotcar = new BigDecimal("0");
        nplazo = 0;
        nredondeo = new BigDecimal("0");
        nsaldo = new BigDecimal("0");
        nfleven = new BigDecimal("0");
        ntipocambio = new BigDecimal("1");
        nretencion = new BigDecimal("0");

    }

    public ComprobanteEmitido(Integer idcomprobante) {
        this.idcomprobante = idcomprobante;
    }

    public Integer getIdcomprobante() {
        return idcomprobante;
    }

    public void setIdcomprobante(Integer idcomprobante) {
        this.idcomprobante = idcomprobante;
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

    public String getCsergui() {
        return csergui;
    }

    public void setCsergui(String csergui) {
        this.csergui = csergui;
    }

    public String getCnumgui() {
        return cnumgui;
    }

    public void setCnumgui(String cnumgui) {
        this.cnumgui = cnumgui;
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

    public BigDecimal getNredondeo() {
        return nredondeo;
    }

    public void setNredondeo(BigDecimal nredondeo) {
        this.nredondeo = nredondeo;
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

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public Vendedor getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Vendedor idvendedor) {
        this.idvendedor = idvendedor;
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

    public RegistroSalida getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(RegistroSalida idregsalida) {
        this.idregsalida = idregsalida;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public CondicionVenta getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(CondicionVenta idcondicion) {
        this.idcondicion = idcondicion;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    public BigDecimal getNfleven() {
        return nfleven;
    }

    public void setNfleven(BigDecimal nfleven) {
        this.nfleven = nfleven;
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

    public BigDecimal getNretencion() {
        return nretencion;
    }

    public void setNretencion(BigDecimal nretencion) {
        this.nretencion = nretencion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcomprobante != null ? idcomprobante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ComprobanteEmitido)) {
            return false;
        }
        ComprobanteEmitido other = (ComprobanteEmitido) object;
        if ((this.idcomprobante == null && other.idcomprobante != null) || (this.idcomprobante != null && !this.idcomprobante.equals(other.idcomprobante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.ComprobanteEmitido[ idcomprobante=" + idcomprobante + " ]";
    }
}
