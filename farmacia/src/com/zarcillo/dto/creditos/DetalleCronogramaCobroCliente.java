package com.zarcillo.dto.creditos;

import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.UnidadNegocio;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author saisa
 */
public class DetalleCronogramaCobroCliente implements Serializable {
    private Integer id;
    private Cliente idcliente;
    private UnidadNegocio idunidad;    
    private Documento iddocumento;
    private Moneda idmoneda;
    private BigDecimal ntipocambio;
    
    private String cserie;
    private String cnumero;
    
    private String csergui;
    private String cnumgui;
    
    private Date dfecemi;
    private Integer nplazo;
    private Date dfecven;
    private Date dfeccan;
    
    private BigDecimal nimporte;
    private BigDecimal nnotabo;
    private BigDecimal nnotcar;
    private BigDecimal nacuenta;
    private BigDecimal nsaldo;
    private Integer ndias;

    public DetalleCronogramaCobroCliente() {
        nacuenta=new BigDecimal("0");
        ndias=0;
        nimporte=new BigDecimal("0");
        nnotabo=new BigDecimal("0");
        nnotcar=new BigDecimal("0");
        nplazo=0;
        nsaldo=new BigDecimal("0");
        ntipocambio=new BigDecimal("0");
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

  

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
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

    public Date getDfeccan() {
        return dfeccan;
    }

    public void setDfeccan(Date dfeccan) {
        this.dfeccan = dfeccan;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
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

    public Integer getNdias() {
        return ndias;
    }

    public void setNdias(Integer ndias) {
        this.ndias = ndias;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.id);
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
        final DetalleCronogramaCobroCliente other = (DetalleCronogramaCobroCliente) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

   
    
    
    
    
    
    
    
}
