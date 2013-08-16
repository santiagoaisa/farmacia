package com.zarcillo.dto.caja;

import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.TipoPago;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "cobropordocumento")
public class CobroPorDocumento implements Serializable {

    @Id
    private BigDecimal id;
    private Integer idregsalida;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Documento iddocumento;
    private String cserie;
    private String cnumero;
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dfecemi;
    private BigDecimal nimporte;
    private BigDecimal nacuenta;
    private BigDecimal nsaldo;
    @JoinColumn(name = "idtipo", referencedColumnName = "idtipo")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private TipoPago idtipo;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dfecmov;
    private BigDecimal nmonto;
    ///////// TOTALES ////////////
    private BigDecimal nefectivo;
    private BigDecimal ntdebito;
    private BigDecimal ntcredito;
    private BigDecimal ntotal;
    

    public CobroPorDocumento() {
        nacuenta=new BigDecimal("0");
        nimporte=new BigDecimal("0");
        nmonto=new BigDecimal("0");
        nsaldo=new BigDecimal("0");
        nefectivo=new BigDecimal("0");
        ntdebito=new BigDecimal("0");
        ntcredito=new BigDecimal("0");
        ntotal=new BigDecimal("0");
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Integer getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(Integer idregsalida) {
        this.idregsalida = idregsalida;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
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

    public CondicionVenta getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(CondicionVenta idcondicion) {
        this.idcondicion = idcondicion;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
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

    public TipoPago getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(TipoPago idtipo) {
        this.idtipo = idtipo;
    }

    public Date getDfecmov() {
        return dfecmov;
    }

    public void setDfecmov(Date dfecmov) {
        this.dfecmov = dfecmov;
    }

    public BigDecimal getNmonto() {
        return nmonto;
    }

    public void setNmonto(BigDecimal nmonto) {
        this.nmonto = nmonto;
    }

    public BigDecimal getNefectivo() {
        return nefectivo;
    }

    public void setNefectivo(BigDecimal nefectivo) {
        this.nefectivo = nefectivo;
    }

    public BigDecimal getNtdebito() {
        return ntdebito;
    }

    public void setNtdebito(BigDecimal ntdebito) {
        this.ntdebito = ntdebito;
    }

    public BigDecimal getNtcredito() {
        return ntcredito;
    }

    public void setNtcredito(BigDecimal ntcredito) {
        this.ntcredito = ntcredito;
    }

    public BigDecimal getNtotal() {
        return ntotal;
    }

    public void setNtotal(BigDecimal ntotal) {
        this.ntotal = ntotal;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + Objects.hashCode(this.idregsalida);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CobroPorDocumento other = (CobroPorDocumento) obj;
        if (!Objects.equals(this.idregsalida, other.idregsalida)) {
            return false;
        }
        return true;
    }
    
    
    
    
}
