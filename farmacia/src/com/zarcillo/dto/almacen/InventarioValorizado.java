package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Linea;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class InventarioValorizado implements Serializable {

    private BigDecimal id;
    private Linea idlinea;
    private BigDecimal ncosto;
    private BigDecimal pcosto;
    private BigDecimal nporcentaje;
    private List<DetalleInventarioValorizado> detalleInventarioCollection;

    public InventarioValorizado() {
        ncosto = new BigDecimal("0");
        pcosto = new BigDecimal("0");
        nporcentaje = new BigDecimal("0");
        detalleInventarioCollection = new ArrayList<>();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getNporcentaje() {
        return nporcentaje;
    }

    public void setNporcentaje(BigDecimal nporcentaje) {
        this.nporcentaje = nporcentaje;
    }

    public Linea getIdlinea() {
        return idlinea;
    }

    public void setIdlinea(Linea idlinea) {
        this.idlinea = idlinea;
    }

    public BigDecimal getNcosto() {
        return ncosto.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public BigDecimal getPcosto() {
        return pcosto;
    }

    public void setPcosto(BigDecimal pcosto) {
        this.pcosto = pcosto;
    }

    public List<DetalleInventarioValorizado> getDetalleInventarioCollection() {
        return detalleInventarioCollection;
    }

    public void setDetalleInventarioCollection(List<DetalleInventarioValorizado> detalleInventarioCollection) {
        this.detalleInventarioCollection = detalleInventarioCollection;
    }
}
