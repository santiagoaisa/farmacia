package com.zarcillo.compra;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Producto;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import com.zarcillo.service.ExceptionZarcillo;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class ActualizarExistencia implements Serializable {

    private Producto idproducto;
    private Almacen idalmacen;
    private Integer nstock;
    private Integer nstockm;
    private BigDecimal nvaluni;
    private BigDecimal nincremento;
    private BigDecimal ncosuni;
    private BigDecimal ncospre;
    private BigDecimal npreuni;
    private BigDecimal nutilidad;

    public ActualizarExistencia() {
        ncospre = new BigDecimal("0");
        ncosuni = new BigDecimal("0");
        npreuni = new BigDecimal("0");
        nstock = 0;
        nstockm = 0;
        nutilidad = new BigDecimal("0");
        nincremento = new BigDecimal("0");
        nvaluni = new BigDecimal("0");
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }

    public Integer getNstock() {
        return nstock;
    }

    public void setNstock(Integer nstock) {
        this.nstock = nstock;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNcospre() {
        return ncospre;
    }

    public void setNcospre(BigDecimal ncospre) {
        this.ncospre = ncospre;
    }

    public BigDecimal getNpreuni() {
        return npreuni;
    }

    public void setNpreuni(BigDecimal npreuni) {
        this.npreuni = npreuni;
        calculaUtilidad();
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
    }

    public BigDecimal getNincremento() {
        return nincremento;
    }

    public void setNincremento(BigDecimal nincremento) {
        this.nincremento = nincremento;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        this.nvaluni = nvaluni;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        BigDecimal nvalor = ((nutilidad.add(Numero.cien)).multiply(ncosuni)).divide(Numero.cien, 4, BigDecimal.ROUND_HALF_UP);
        nvaluni = nvalor;
        npreuni = Igv.importeDetalleVenta(nvalor, this.getIdproducto().getBinafecto());

        this.nutilidad = nutilidad;
    }

    public void calculaUtilidad() {
        if (Numero.isCero(ncosuni)) {
            nutilidad = Numero.cien;
        } else {
            nutilidad = nvaluni.multiply(Numero.cien.divide(ncosuni, 4, BigDecimal.ROUND_HALF_UP)).subtract(Numero.cien);
        }
    }
}
