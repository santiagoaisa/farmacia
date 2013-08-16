package com.zarcillo.dto.caja;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author saisa
 */
public class ResumenCobroPorFecha implements Serializable{
    private Date dfecha;
    private BigDecimal nefectivo;
    private BigDecimal ntdebito;
    private BigDecimal ntcredito;
    private BigDecimal ntotal;

    public ResumenCobroPorFecha() {
        nefectivo=new BigDecimal("0");
        ntdebito=new BigDecimal("0");
        ntcredito=new BigDecimal("0");
        ntotal=new BigDecimal("0");
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
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
    
    
    
    
}
