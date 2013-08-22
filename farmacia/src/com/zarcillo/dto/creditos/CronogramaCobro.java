
package com.zarcillo.dto.creditos;

import com.zarcillo.dto.finanzas.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author saisa
 */
public class CronogramaCobro implements Serializable{
    private String cdia;
    private Date dfecha;
    private BigDecimal nfactura;
    private BigDecimal nletra;
    private BigDecimal ntotal;
    
    private List<CronogramaCobroCliente> detalleCronogramaCobroClienteCollection;

    public CronogramaCobro() {
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

    public List<CronogramaCobroCliente> getDetalleCronogramaCobroClienteCollection() {
        return detalleCronogramaCobroClienteCollection;
    }

    public void setDetalleCronogramaCobroClienteCollection(List<CronogramaCobroCliente> detalleCronogramaCobroClienteCollection) {
        this.detalleCronogramaCobroClienteCollection = detalleCronogramaCobroClienteCollection;
    }

    
    

    public void totalizar(){
        BigDecimal nfa=new BigDecimal("0");
        BigDecimal nle=new BigDecimal("0");
        for(CronogramaCobroCliente d:detalleCronogramaCobroClienteCollection){
            nfa=nfa.add(d.getNfactura());
            nle=nle.add(d.getNletra());
        }
        nfactura=nfa;
        nletra=nle;
        ntotal=nfa.add(nle);
        
    }
    
    
}
