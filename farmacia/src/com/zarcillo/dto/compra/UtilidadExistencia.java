package com.zarcillo.dto.compra;

import com.zarcillo.domain.Producto;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author saisa
 */
public class UtilidadExistencia implements Serializable{
    private Date dfecha;
    private Producto idproducto;
    private Integer ncantidad;
    private Integer ncantidadm;
    private BigDecimal ncosuni;
    private BigDecimal nvaluni;
    private BigDecimal nsubtot;
    private BigDecimal nsubcos;
    private BigDecimal nutilidad;
    private BigDecimal nganancia;

    public UtilidadExistencia() {
        ncantidad=0;
        ncantidadm=0;
        ncosuni=new BigDecimal("0");
        nganancia=new BigDecimal("0");
        nsubcos=new BigDecimal("0");
        nsubtot=new BigDecimal("0");
        nutilidad=new BigDecimal("0");
        nvaluni=new BigDecimal("0");
        
    }

   

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public Producto getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Producto idproducto) {
        this.idproducto = idproducto;
    }

    public Integer getNcantidad() {
        return ncantidad;
    }

    public void setNcantidad(Integer ncantidad) {
        this.ncantidad = ncantidad;
    }

    public Integer getNcantidadm() {
        return ncantidadm;
    }

    public void setNcantidadm(Integer ncantidadm) {
        this.ncantidadm = ncantidadm;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        this.nvaluni = nvaluni;
    }

    public BigDecimal getNsubtot() {
        return nsubtot;
    }

    public void setNsubtot(BigDecimal nsubtot) {
        this.nsubtot = nsubtot;
    }

    public BigDecimal getNsubcos() {
        return nsubcos;
    }

    public void setNsubcos(BigDecimal nsubcos) {
        this.nsubcos = nsubcos;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        this.nutilidad = nutilidad;
    }

    public BigDecimal getNganancia() {
        return nganancia;
    }

    public void setNganancia(BigDecimal nganancia) {
        this.nganancia = nganancia;
    }
            
    public void calculaUtilidad() {
         
         
        if (Numero.isCero(nsubcos)) {
            nutilidad = Numero.cien;
        } else {
            nutilidad = (nsubtot.multiply(Numero.cien.divide(nsubcos, 4, BigDecimal.ROUND_HALF_UP)).subtract(Numero.cien)).setScale(2, BigDecimal.ROUND_HALF_UP);;
        }
    }
    
    
}
