package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "anulacion")
@NamedQueries({
    @NamedQuery(name = "Anulacion.findAll", query = "SELECT a FROM Anulacion a"),
    @NamedQuery(name = "Anulacion.findByFechas", query = "SELECT a FROM Anulacion a WHERE a.dfecha BETWEEN :dfecha1 and :dfecha2 ORDER BY a.dfecha,a.iddocumento.iddocumento,a.cserie,a.cnumero ")

})
public class Anulacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idanulacion")
    private Integer idanulacion;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoSalida idmotivo;
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    @Column(name = "csergui")
    private String csergui;
    @Column(name = "cnumgui")
    private String cnumgui;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nfleven")
    private BigDecimal nfleven;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nredondeo")
    private BigDecimal nredondeo;
    @Column(name = "ncosto")
    private BigDecimal ncosto;
    @Column(name = "nplazo")
    private Integer nplazo;
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "nidregsalida")
    private Integer nidregsalida;
    @JoinColumn(name = "idmotanu", referencedColumnName = "idmotanu")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoAnulacion idmotanu;
    @OneToMany(mappedBy = "idanulacion", fetch = FetchType.LAZY)
    private List<DetalleAnulacion> detalleAnulacionCollection;

    public Anulacion() {
        nafecto = new BigDecimal("0");
        ncosto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        nplazo = 0;
        nredondeo = new BigDecimal("0");
        detalleAnulacionCollection = new ArrayList<>();
        nfleven = new BigDecimal("0");
        ntipocambio = new BigDecimal("1");
    }

    public Anulacion(Integer idanulacion) {
        this.idanulacion = idanulacion;
    }

    public Integer getIdanulacion() {
        return idanulacion;
    }

    public void setIdanulacion(Integer idanulacion) {
        this.idanulacion = idanulacion;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
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

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
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

    public BigDecimal getNfleven() {
        return nfleven;
    }

    public void setNfleven(BigDecimal nfleven) {
        this.nfleven = nfleven;
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

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Integer getNidregsalida() {
        return nidregsalida;
    }

    public void setNidregsalida(Integer nidregsalida) {
        this.nidregsalida = nidregsalida;
    }

    public List<DetalleAnulacion> getDetalleAnulacionCollection() {
        return detalleAnulacionCollection;
    }

    public void setDetalleAnulacionCollection(List<DetalleAnulacion> detalleAnulacionCollection) {
        this.detalleAnulacionCollection = detalleAnulacionCollection;
    }

    public MotivoAnulacion getIdmotanu() {
        return idmotanu;
    }

    public void setIdmotanu(MotivoAnulacion idmotanu) {
        this.idmotanu = idmotanu;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
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

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Moneda getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(Moneda idmoneda) {
        this.idmoneda = idmoneda;
    }

    public MotivoSalida getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoSalida idmotivo) {
        this.idmotivo = idmotivo;
    }

    public CondicionVenta getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(CondicionVenta idcondicion) {
        this.idcondicion = idcondicion;
    }

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public Integer getNplazo() {
        return nplazo;
    }

    public void setNplazo(Integer nplazo) {
        this.nplazo = nplazo;
    }

    public BigDecimal getNtipocambio() {
        return ntipocambio;
    }

    public void setNtipocambio(BigDecimal ntipocambio) {
        this.ntipocambio = ntipocambio;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }
    
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idanulacion != null ? idanulacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Anulacion)) {
            return false;
        }
        Anulacion other = (Anulacion) object;
        if ((this.idanulacion == null && other.idanulacion != null) || (this.idanulacion != null && !this.idanulacion.equals(other.idanulacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.zarcillo.domain.Anulacion[ idanulacion=" + idanulacion + " ]";
    }
}
