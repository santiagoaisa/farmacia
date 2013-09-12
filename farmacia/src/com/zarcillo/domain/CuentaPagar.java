package com.zarcillo.domain;

import com.zarcillo.negocio.Dia;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import com.zarcillo.service.ExceptionZarcillo;
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
@Table(name = "cuenta_pagar")
@NamedQueries({
    @NamedQuery(name = "CuentaPagar.findAll", query = "SELECT c FROM CuentaPagar c"),    
    @NamedQuery(name = "CuentaPagar.findByDfechasPendientes", query = "SELECT c FROM CuentaPagar c WHERE c.dfecven BETWEEN :dfecha1  and :dfecha2 and c.nsaldo>0 ORDER BY c.dfecven,c.cnumero"),    
    @NamedQuery(name = "CuentaPagar.findByIdunidadByIdproveedorByNano", query = "SELECT c FROM CuentaPagar c WHERE c.idunidad.idunidad =:idunidad and c.idproveedor.idproveedor=:idproveedor and c.idperiodo.nano=:nano ORDER BY c.dfecemi DESC "),
    @NamedQuery(name = "CuentaPagar.findByIdunidadByIdproveedorByNanoPendientes", query = "SELECT c FROM CuentaPagar c WHERE c.idunidad.idunidad =:idunidad and c.idproveedor.idproveedor=:idproveedor and c.idperiodo.nano=:nano and c.nsaldo>0 ORDER BY c.dfecemi DESC "),
    @NamedQuery(name = "CuentaPagar.findByIdcuenta", query = "SELECT c FROM CuentaPagar c WHERE c.idcuenta=:idcuenta"),
    @NamedQuery(name = "CuentaPagar.findByIdregentrada", query = "SELECT c FROM CuentaPagar c WHERE c.idregentrada.idregentrada=:idregentrada")
})
public class CuentaPagar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcuenta")
    private Integer idcuenta;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "csergui")
    private String csergui;
    @Column(name = "cnumgui")
    private String cnumgui;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    
    @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "nplazo")
    private Integer nplazo;
    @Column(name = "dfecven")
    @Temporal(TemporalType.DATE)
    private Date dfecven;
    @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;
    @Column(name = "nnotabo")
    private BigDecimal nnotabo;
    @Column(name = "nnotcar")
    private BigDecimal nnotcar;
    @Column(name = "ningreso")
    private BigDecimal ningreso;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idregentrada", referencedColumnName = "idregentrada")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroEntrada idregentrada;
    @JoinColumn(name = "idproveedor", referencedColumnName = "idproveedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Proveedor idproveedor;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @Column(name = "npercepcion")
    private BigDecimal npercepcion;
    @Column(name = "nreclamodevolucion")
    private BigDecimal nreclamodevolucion;
    @Column(name = "nreclamoprecio")
    private BigDecimal nreclamoprecio;
    @Column(name = "ntotalreclamo")
    private BigDecimal ntotalreclamo;

    public CuentaPagar() {
        nacuenta = new BigDecimal("0");
        nafecto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        ningreso = new BigDecimal("0");
        ningreso = new BigDecimal("0");
        nnotabo = new BigDecimal("0");
        nnotcar = new BigDecimal("0");
        nplazo = 0;
        nsaldo = new BigDecimal("0");
        ntipocambio = new BigDecimal("1");
        npercepcion = new BigDecimal("0");
        nreclamodevolucion = new BigDecimal("0");
        nreclamoprecio = new BigDecimal("0");
        ntotalreclamo = new BigDecimal("0");
    }

    public CuentaPagar(Integer idcuenta) {
        this.idcuenta = idcuenta;
    }

    public Integer getIdcuenta() {
        return idcuenta;
    }

    public void setIdcuenta(Integer idcuenta) {
        this.idcuenta = idcuenta;
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

    public BigDecimal getNtipocambio() {
        return ntipocambio;
    }

    public void setNtipocambio(BigDecimal ntipocambio) {
        this.ntipocambio = ntipocambio;
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

    public Date getDfeccan() {
        return dfeccan;
    }

    public void setDfeccan(Date dfeccan) {
        this.dfeccan = dfeccan;
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

    public BigDecimal getNingreso() {
        return ningreso;
    }

    public void setNingreso(BigDecimal ningreso) {
        this.ningreso = ningreso;
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

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public RegistroEntrada getIdregentrada() {
        return idregentrada;
    }

    public void setIdregentrada(RegistroEntrada idregentrada) {
        this.idregentrada = idregentrada;
    }

    public Proveedor getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Proveedor idproveedor) {
        this.idproveedor = idproveedor;
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

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public BigDecimal getNpercepcion() {
        return npercepcion;
    }

    public void setNpercepcion(BigDecimal npercepcion) {
        this.npercepcion = npercepcion;
    }

    public BigDecimal getNreclamodevolucion() {
        return nreclamodevolucion;
    }

    public void setNreclamodevolucion(BigDecimal nreclamodevolucion) {
        this.nreclamodevolucion = nreclamodevolucion;
    }

    public BigDecimal getNreclamoprecio() {
        return nreclamoprecio;
    }

    public void setNreclamoprecio(BigDecimal nreclamoprecio) {
        this.nreclamoprecio = nreclamoprecio;
    }

    public BigDecimal getNtotalreclamo() {
        return ntotalreclamo;
    }

    public void setNtotalreclamo(BigDecimal ntotalreclamo) {
        this.ntotalreclamo = ntotalreclamo;
    }

    public Date calculaVencimiento() {
        this.dfecven = Dia.sumarDias(this.dfecemi, this.nplazo);
        return dfecven;
    }

    public void calcula(BigDecimal nmontoigv) {
        this.setNigv(Igv.Igv(nmontoigv, this.nafecto));
        this.setNimporte(this.nafecto.add(this.ninafecto.add(this.nigv)));

        if (!Numero.isCero(this.getNingreso())) {
            this.setNreclamodevolucion(this.nimporte.subtract(this.getNingreso()));
            this.setNtotalreclamo(nreclamodevolucion.add(nreclamoprecio));
        }
    }

    public void validarTotalesIngreso() {
        if (!Numero.isCero(this.getNingreso())) {
            BigDecimal totalingreso = this.ningreso.add(this.nreclamodevolucion.add(this.nreclamoprecio));
            BigDecimal diferencia = (this.nimporte.multiply(this.getNtipocambio())).subtract(totalingreso);

            int rpta = diferencia.abs().compareTo(new BigDecimal("5"));
            if (rpta == 1) {
                throw new ExceptionZarcillo("El Importe de la factura no cuadra con el Importe del Ingreso");
            }
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcuenta != null ? idcuenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CuentaPagar)) {
            return false;
        }
        CuentaPagar other = (CuentaPagar) object;
        if ((this.idcuenta == null && other.idcuenta != null) || (this.idcuenta != null && !this.idcuenta.equals(other.idcuenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cserie + "-" + cnumero;
    }
}
