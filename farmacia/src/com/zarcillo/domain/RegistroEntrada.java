package com.zarcillo.domain;

import com.zarcillo.negocio.Igv;
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
@Table(name = "registro_entrada")
@NamedQueries({
    @NamedQuery(name = "RegistroEntrada.findAll", query = "SELECT r FROM RegistroEntrada r"),
    @NamedQuery(name = "RegistroEntrada.findByIdalmacenByIdregentrada", query = "SELECT r FROM RegistroEntrada r WHERE r.idalmacen.idalmacen=:idalmacen and r.idregentrada=:idregentrada"),
    @NamedQuery(name = "RegistroEntrada.findByIdregentrada", query = "SELECT r FROM RegistroEntrada r WHERE r.idregentrada=:idregentrada"),
    @NamedQuery(name = "RegistroEntrada.findByIdalmacenByIdproveedorByNano", query = "SELECT r FROM RegistroEntrada r WHERE r.idalmacen.idalmacen=:idalmacen and r.idproveedor.idproveedor=:idproveedor and r.idperiodo.nano=:nano ORDER BY r.dfecha DESC "),
    @NamedQuery(name = "RegistroEntrada.findByIdalmacenByFechas", query = "SELECT r FROM RegistroEntrada r WHERE r.idalmacen.idalmacen=:idalmacen and r.dfecha BETWEEN :dfecha1 and :dfecha2 ")
})
public class RegistroEntrada implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idregentrada")
    private Integer idregentrada;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idproveedor", referencedColumnName = "idproveedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Proveedor idproveedor;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
    @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoEntrada idmotivo;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Almacen idalmacen;
    @OneToMany(mappedBy = "idregentrada", fetch = FetchType.LAZY)
    private List<Movimiento> movimientoCollection;
     @Column(name = "cobservacion")
    private String cobservacion;

    public RegistroEntrada() {
        nafecto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");
        movimientoCollection = new ArrayList<Movimiento>();
        cobservacion="";
    }

    public RegistroEntrada(Integer idregentrada) {
        this.idregentrada = idregentrada;
    }

    public Integer getIdregentrada() {
        return idregentrada;
    }

    public void setIdregentrada(Integer idregentrada) {
        this.idregentrada = idregentrada;
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

    public MotivoEntrada getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoEntrada idmotivo) {
        this.idmotivo = idmotivo;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
    }

    public List<Movimiento> getMovimientoCollection() {
        return movimientoCollection;
    }

    public void setMovimientoCollection(List<Movimiento> movimientoCollection) {
        this.movimientoCollection = movimientoCollection;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
    }

    
    
    public void calcula(BigDecimal nmontoigv) {
        BigDecimal valorinafecto = new BigDecimal("0.00");
        BigDecimal valorventa = new BigDecimal("0.00");
        BigDecimal igv = new BigDecimal("0.00");
        BigDecimal preven = new BigDecimal("0.00");

        List<Movimiento> listaMovimiento = this.getMovimientoCollection();

        for (Movimiento m : listaMovimiento) {

            if (!m.getBinafecto()) {
                valorventa = valorventa.add(m.getNsubtot());
                igv = igv.add(Igv.Igv(nmontoigv, m.getNsubtot()));
            } else {
                valorinafecto = valorinafecto.add(m.getNsubtot());
            }
        }

        preven = preven.add(valorventa.add(igv));
        this.ninafecto = valorinafecto;
        this.nafecto = valorventa;
        this.nigv = igv;
        this.nimporte = preven;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idregentrada != null ? idregentrada.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RegistroEntrada)) {
            return false;
        }
        RegistroEntrada other = (RegistroEntrada) object;
        if ((this.idregentrada == null && other.idregentrada != null) || (this.idregentrada != null && !this.idregentrada.equals(other.idregentrada))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return idregentrada + "";
    }
}
