package com.zarcillo.estadistica;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Producto;
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
@Table(name = "util.ventapordocumento")
public class VentaPorDocumento implements Serializable {

    @Id
    private BigDecimal id;
    private Integer idregsalida;
    @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Documento iddocumento;
    
    @Temporal(javax.persistence.TemporalType.DATE)
      private Date dfecemi;
    
    private String cserie;
    private String cnumero;
    
    @JoinColumn(name = "idcondicion", referencedColumnName = "idcondicion")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private CondicionVenta idcondicion;
    
    private BigDecimal nafecto;
    private BigDecimal ninafecto;
    private BigDecimal nigv;
    private BigDecimal nredondeo;
    private BigDecimal nimporte;
    private BigDecimal ncosto;
    private BigDecimal nutilidad;

    public VentaPorDocumento() {
        nafecto = new BigDecimal("0");
        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");
        ninafecto = new BigDecimal("0");        
        nutilidad = new BigDecimal("0");
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

    public BigDecimal getNredondeo() {
        return nredondeo;
    }

    public void setNredondeo(BigDecimal nredondeo) {
        this.nredondeo = nredondeo;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
    }

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        this.nutilidad = nutilidad;
    }

    
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.idregsalida);
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
        final VentaPorDocumento other = (VentaPorDocumento) obj;
        if (!Objects.equals(this.idregsalida, other.idregsalida)) {
            return false;
        }
        return true;
    }
    
    
    
    
    
}
