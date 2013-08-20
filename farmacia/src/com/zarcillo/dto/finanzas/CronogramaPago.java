
package com.zarcillo.dto.finanzas;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public class CronogramaPago implements Serializable{
    private Date dfecha;
    private BigDecimal nfactura;
    private BigDecimal nletra;
    private BigDecimal ntotal;
    
    private List<DetalleCronogramaPago> detalleCronogramaPagoCollection;

    public CronogramaPago() {
        nfactura=new BigDecimal("0");
        nletra=new BigDecimal("0");
        ntotal=new BigDecimal("0");
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public BigDecimal getNfactura() {
        return nfactura;
    }

    public void setNfactura(BigDecimal nfactura) {
        this.nfactura = nfactura;
    }

    public BigDecimal getNletra() {
        return nletra;
    }

    public void setNletra(BigDecimal nletra) {
        this.nletra = nletra;
    }

    public BigDecimal getNtotal() {
        return ntotal;
    }

    public void setNtotal(BigDecimal ntotal) {
        this.ntotal = ntotal;
    }

    public List<DetalleCronogramaPago> getDetalleCronogramaPagoCollection() {
        return detalleCronogramaPagoCollection;
    }

    public void setDetalleCronogramaPagoCollection(List<DetalleCronogramaPago> detalleCronogramaPagoCollection) {
        this.detalleCronogramaPagoCollection = detalleCronogramaPagoCollection;
    }
    
    
    
    
}
