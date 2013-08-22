package com.zarcillo.dto.creditos;

import com.zarcillo.domain.Cliente;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author saisa
 */
public class CronogramaCobroCliente implements Serializable{
    private Cliente idcliente;
    private BigDecimal nfactura;
    private BigDecimal nletra;
    private BigDecimal ntotal;

     private List<DetalleCronogramaCobroCliente> detalleCronogramaCobroClienteCollection;
    
    public CronogramaCobroCliente() {
        nfactura=new BigDecimal("0");
        nletra=new BigDecimal("0");
        ntotal=new BigDecimal("0");
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
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

    public List<DetalleCronogramaCobroCliente> getDetalleCronogramaCobroClienteCollection() {
        return detalleCronogramaCobroClienteCollection;
    }

    public void setDetalleCronogramaCobroClienteCollection(List<DetalleCronogramaCobroCliente> detalleCronogramaCobroClienteCollection) {
        this.detalleCronogramaCobroClienteCollection = detalleCronogramaCobroClienteCollection;
    }

    

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + Objects.hashCode(this.idcliente);
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
        final CronogramaCobroCliente other = (CronogramaCobroCliente) obj;
        if (!Objects.equals(this.idcliente, other.idcliente)) {
            return false;
        }
        return true;
    }

    
    
    
   
    
    
    
}
