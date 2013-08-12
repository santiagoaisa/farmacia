package com.zarcillo.domain;

import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
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
@Table(name = "registro_salida")
@NamedQueries({
    @NamedQuery(name = "RegistroSalida.findAll", query = "SELECT r FROM RegistroSalida r"),
    @NamedQuery(name = "RegistroSalida.findByIdregsalida", query = "SELECT r FROM RegistroSalida r WHERE r.idregsalida=:idregsalida"),
    @NamedQuery(name = "RegistroSalida.findByIdunidadByIdregsalida", query = "SELECT r FROM RegistroSalida r WHERE r.idunidad.idunidad=:idunidad and r.idregsalida=:idregsalida")
})
public class RegistroSalida implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idregsalida")
    private Integer idregsalida;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "csergui")
    private String csergui;
    @Column(name = "cnumgui")
    private String cnumgui;
    @Column(name = "nplazo")
    private Integer nplazo;
    @Column(name = "dfecven")
    @Temporal(TemporalType.DATE)
    private Date dfecven;
    @Column(name = "dfecdig")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecdig;
    @Column(name = "dfecimp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecimp;
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
    @Column(name = "ncosto")
    private BigDecimal ncosto;
    @Column(name = "cglosa")
    private String cglosa;
    @Column(name = "cobservacion")
    private String cobservacion;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "bimpreso")
    private Boolean bimpreso;
    @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoSalida idmotivo;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    @OneToMany(mappedBy = "idregentrada", fetch = FetchType.LAZY)
    private List<Movimiento> movimientoCollection;
    @Column(name = "nfleven")
    private BigDecimal nfleven;
    @JoinColumn(name = "idsituacion", referencedColumnName = "idsituacion")
    @ManyToOne(fetch = FetchType.EAGER)
    private SituacionPedido idsituacion;
    @JoinColumn(name = "idmoneda", referencedColumnName = "idmoneda")
    @ManyToOne(fetch = FetchType.EAGER)
    private Moneda idmoneda;
    @Column(name = "ntipocambio")
    private BigDecimal ntipocambio;
    @Column(name = "cdni")
    private String cdni;
    @Column(name = "cnomcli")
    private String cnomcli;
    @Column(name = "banulado")
    private Boolean banulado;

    public RegistroSalida() {
        nafecto = new BigDecimal("0");
        ncosto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        nplazo = 0;
        nredondeo = new BigDecimal("0");
        movimientoCollection = new ArrayList<Movimiento>();
        nfleven = new BigDecimal("0");
        ntipocambio = new BigDecimal("1");
        banulado = false;
        bimpreso=false;

    }

    public RegistroSalida(Integer idregsalida) {
        this.idregsalida = idregsalida;
    }

    public Integer getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(Integer idregsalida) {
        this.idregsalida = idregsalida;
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

    public Date getDfecdig() {
        return dfecdig;
    }

    public void setDfecdig(Date dfecdig) {
        this.dfecdig = dfecdig;
    }

    public Date getDfecimp() {
        return dfecimp;
    }

    public void setDfecimp(Date dfecimp) {
        this.dfecimp = dfecimp;
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

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public String getCglosa() {
        return cglosa;
    }

    public void setCglosa(String cglosa) {
        this.cglosa = cglosa;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Boolean getBimpreso() {
        return bimpreso;
    }

    public void setBimpreso(Boolean bimpreso) {
        this.bimpreso = bimpreso;
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

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    public MotivoSalida getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoSalida idmotivo) {
        this.idmotivo = idmotivo;
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

    public List<Movimiento> getMovimientoCollection() {
        return movimientoCollection;
    }

    public void setMovimientoCollection(List<Movimiento> movimientoCollection) {
        this.movimientoCollection = movimientoCollection;
    }

    public BigDecimal getNfleven() {
        return nfleven;
    }

    public void setNfleven(BigDecimal nfleven) {
        this.nfleven = nfleven;
    }

    public SituacionPedido getIdsituacion() {
        return idsituacion;
    }

    public void setIdsituacion(SituacionPedido idsituacion) {
        this.idsituacion = idsituacion;
    }

    public void calcula(BigDecimal nmontoigv) {
        //Calculo los totales de la cabecera        
        BigDecimal tvalornogra = new BigDecimal("0.00");
        BigDecimal tvalorventa = new BigDecimal("0.00");
        /////////////////
        BigDecimal tcosto = new BigDecimal("0.00");

        List<Movimiento> lista = this.getMovimientoCollection();

        for (Movimiento m : lista) {
            //valido y elimino detalle nulos
            if (m.getIdproducto() != null) {
                //Acumulo el valor Bruto             

                BigDecimal cantidadsalida = new BigDecimal(m.getNcantidad());
                if (m.getNcantidad() == 0) {
                    if (m.getNcantidadm() > 0) {
                        cantidadsalida = new BigDecimal(m.getNcantidadm()).divide(new BigDecimal(m.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                    }
                }
                
                tcosto = tcosto.add(m.getNcosuni().multiply(cantidadsalida));
                //Acumulo los totales
                if (m.getIdproducto().getBinafecto()) {
                    //si es inafecto
                    tvalornogra = tvalornogra.add(m.getNsubtot());
                } else {
                    //si es afecto
                    tvalorventa = tvalorventa.add(m.getNsubtot());
                }
            }
        }
        this.ncosto = tcosto;
        this.ninafecto = tvalornogra;
        this.nafecto = tvalorventa;
        //Bonificacion=(valorventa+valorsinigv)-valorbruto        
        // fleven
        tvalorventa = tvalorventa.add(this.getNfleven());

        this.nigv = Igv.Igv(nmontoigv, tvalorventa);
        //Importe total=(valorventa*igv)+valorsinigv
        this.nimporte = Igv.Importe(nmontoigv, tvalorventa).add(tvalornogra);
        //calculo el redondeo
        BigDecimal preciofinal = this.nimporte.divide(Numero.diez, 2, BigDecimal.ROUND_HALF_UP);
        preciofinal = preciofinal.multiply(Numero.diez);
        this.nredondeo = preciofinal.subtract(this.nimporte);
        //fin de redondeo
        this.nimporte = preciofinal;
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

    public String getCdni() {
        return cdni;
    }

    public void setCdni(String cdni) {
        this.cdni = cdni;
    }

    public String getCnomcli() {
        return cnomcli;
    }

    public void setCnomcli(String cnomcli) {
        this.cnomcli = cnomcli;
    }

    public Boolean getBanulado() {
        return banulado;
    }

    public void setBanulado(Boolean banulado) {
        this.banulado = banulado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idregsalida != null ? idregsalida.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RegistroSalida)) {
            return false;
        }
        RegistroSalida other = (RegistroSalida) object;
        if ((this.idregsalida == null && other.idregsalida != null) || (this.idregsalida != null && !this.idregsalida.equals(other.idregsalida))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return idregsalida + "";
    }
}
