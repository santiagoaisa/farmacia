package com.zarcillo.dto.venta;

import com.zarcillo.domain.Producto;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author saisa
 */
public class ListadoPrecio implements Serializable {

    private Producto idproducto;
    private Integer nstock;
    private Integer nstockm;
    private BigDecimal nincremento;
    private BigDecimal ncosuni;    
    private BigDecimal nprecos;    
    private BigDecimal nvaluni;
    private BigDecimal nvalunim;
    private BigDecimal npreuni;
    private BigDecimal npreunim;
    private BigDecimal nutilidad;

    public ListadoPrecio() {
        ncosuni=new BigDecimal("0");
        nincremento=new BigDecimal("0");
        npreuni=new BigDecimal("0");
        npreunim=new BigDecimal("0");
        nstock=0;
        nstockm=0;
        nvaluni=new BigDecimal("0");
        nutilidad=new BigDecimal("0");
        nvalunim=new BigDecimal("0");
        nprecos=new BigDecimal("0");
    }

    public BigDecimal getNvalunim() {
        return nvalunim;
    }

    public void setNvalunim(BigDecimal nvalunim) {
        this.nvalunim = nvalunim;
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

    public BigDecimal getNincremento() {
        return nincremento;
    }

    public void setNincremento(BigDecimal nincremento) {
        this.nincremento = nincremento;
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

    public BigDecimal getNpreuni() {
        return npreuni;
    }

    public void setNpreuni(BigDecimal npreuni) {
        this.npreuni = npreuni;
    }

    public BigDecimal getNpreunim() {
        return npreunim;
    }

    public void setNpreunim(BigDecimal npreunim) {
        this.npreunim = npreunim;
    }

    public BigDecimal getNutilidad() {
        return nutilidad;
    }

    public void setNutilidad(BigDecimal nutilidad) {
        this.nutilidad = nutilidad;
    }

    public BigDecimal getNprecos() {
        return nprecos;
    }

    public void setNprecos(BigDecimal nprecos) {
        this.nprecos = nprecos;
    }

    
    
   
    public void calculaUtilidad(){
        if(Numero.isCero(ncosuni)){
            nutilidad=Numero.cien;            
        }else{
            nutilidad = nvaluni.multiply(Numero.cien.divide(ncosuni, 4, BigDecimal.ROUND_HALF_UP)).subtract(Numero.cien);
        }
    }
    
    
    
}
