package com.zarcillo.dto.finanzas;

import com.zarcillo.domain.Proveedor;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author saisa
 */
public class CronogramaPagoProveedor implements Serializable{
    private Proveedor idproveedor;
    private BigDecimal nfactura;
    private BigDecimal nletra;
    private BigDecimal ntotal;

     private List<DetalleCronogramaPagoProveedor> detalleCronogramaPagoProveedorCollection;
    
    public CronogramaPagoProveedor() {
        nfactura=new BigDecimal("0");
        nletra=new BigDecimal("0");
        ntotal=new BigDecimal("0");
    }

    public Proveedor getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(Proveedor idproveedor) {
        this.idproveedor = idproveedor;
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

    public List<DetalleCronogramaPagoProveedor> getDetalleCronogramaPagoProveedorCollection() {
        return detalleCronogramaPagoProveedorCollection;
    }

    public void setDetalleCronogramaPagoProveedorCollection(List<DetalleCronogramaPagoProveedor> detalleCronogramaPagoProveedorCollection) {
        this.detalleCronogramaPagoProveedorCollection = detalleCronogramaPagoProveedorCollection;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.idproveedor);
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
        final CronogramaPagoProveedor other = (CronogramaPagoProveedor) obj;
        if (!Objects.equals(this.idproveedor, other.idproveedor)) {
            return false;
        }
        return true;
    }
    
    
    
}
