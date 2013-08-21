
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
    private String cdia;
    private Date dfecha;
    private BigDecimal nfactura;
    private BigDecimal nletra;
    private BigDecimal ntotal;
    
    private List<CronogramaPagoProveedor> detalleCronogramaPagoProveedorCollection;

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

    public String getCdia() {
        return cdia;
    }

    public void setCdia(String cdia) {
        this.cdia = cdia;
    }

    public List<CronogramaPagoProveedor> getDetalleCronogramaPagoProveedorCollection() {
        return detalleCronogramaPagoProveedorCollection;
    }

    public void setDetalleCronogramaPagoProveedorCollection(List<CronogramaPagoProveedor> detalleCronogramaPagoProveedorCollection) {
        this.detalleCronogramaPagoProveedorCollection = detalleCronogramaPagoProveedorCollection;
    }

    public void totalizar(){
        BigDecimal nfa=new BigDecimal("0");
        BigDecimal nle=new BigDecimal("0");
        for(CronogramaPagoProveedor d:detalleCronogramaPagoProveedorCollection){
            nfa=nfa.add(d.getNfactura());
            nle=nle.add(d.getNletra());
        }
        nfactura=nfa;
        nletra=nle;
        ntotal=nfa.add(nle);
        
    }
    
    
}
