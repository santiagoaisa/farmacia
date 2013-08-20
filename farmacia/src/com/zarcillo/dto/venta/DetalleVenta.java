package com.zarcillo.dto.venta;

import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class DetalleVenta implements Serializable {

    private Date dfecha;
    private Integer id;
    private Integer ncanart;
    private Integer ncanartm;
    private BigDecimal ncosuni;
   private BigDecimal ncosunim;
    // nstock maximo que se puede digitar super importante cuando se digita
    private Integer nstock;    //
    private Integer nstockm;    //
     private Integer nstockfraccion;    
    private BigDecimal nvaluni;
    //valor auxiliar para menudeo
    private BigDecimal nvalunim;
    
    private BigDecimal npreuni;
    private BigDecimal npreunim;
    
    private BigDecimal nigv;
    private BigDecimal nimporte;
    private BigDecimal ndesfin;
    private BigDecimal ndesbon;
    private BigDecimal ndeslab;
    private Existencia existencia;
    private BigDecimal nsubtot;
    // stock que actualiza el temporal de existencias
    private Integer nstktemporal;
    private Descuento descuento;
    private Integer idventana;
    private Integer idindex;
    // Valores Maximos
    // Controla si el detalle del pedido es a valor neto
    private Boolean bneto;
    // margen minimo
    private BigDecimal nmargenminimo;
    //lotes
    private String clote;
    private String cfecven;
    //referencia documento de entrada
    private String cingreso;
    //referencia documento de origen
    private String corigen;
    //id regsalida
    private Integer nidregsalida;
    //inafecto
    private boolean binafec;
    private BigDecimal ndesfinmax;
    private boolean bfraccion;
    private boolean bactivo;
    

    public DetalleVenta() {
        dfecha = new Date();
        ncanart = 0;
        ncanartm = 0;
        nvaluni = new BigDecimal("0");
        nvalunim = new BigDecimal("0");
        
        npreuni = new BigDecimal("0");
        npreunim = new BigDecimal("0");
        
        ndesfin = new BigDecimal("0");
        ndeslab = new BigDecimal("0");
        ndesbon = new BigDecimal("0");

        ncosuni = new BigDecimal("0");
        ncosunim = new BigDecimal("0");
        nstock = 0;
        nstockm = 0;
        nsubtot = new BigDecimal("0");
        nstktemporal = 0;
        bneto = false;
        nmargenminimo = new BigDecimal("0");

        nigv = new BigDecimal("0");
        nimporte = new BigDecimal("0");

        binafec = false;
        ndesfinmax = new BigDecimal("0");
        bactivo=true;
        bfraccion=true;
        nstockfraccion=0;
    }

    public Existencia getExistencia() {
        return existencia;
    }

    public void setExistencia(Existencia existencia) {
        this.existencia = existencia;
    }

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNcanart() {
        return ncanart;
    }

    //solo estos metodos se usan en el caso de canjes o devoluciones
    public void setNcantidad(Integer ncanart) {
        if (ncanart == null) {
            ncanart = 0;
        }
        this.ncanart = ncanart;
    }

    public Integer getNcantidad() {
        return ncanart;
    }

    public void setNcanart(Integer ncanart) {        
//        calculaDescuentoEscala(ncanart);
        this.ncanart = ncanart;
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

    public BigDecimal getNcosunim() {
        return ncosunim;
    }

    public void setNcosunim(BigDecimal ncosunim) {
        this.ncosunim = ncosunim;
    }

    
    
    
    
    private void calculaDescuentoEscala(Integer cantidad) {
        //Busco la escala que corresponda
        this.ndesbon = descuento.getDescuento();

        if (cantidad >= descuento.getNcant1() && descuento.getNcant1() > 0) {
            this.ndesbon = descuento.getNdesc1();
        }

        if (cantidad >= descuento.getNcant2() && descuento.getNcant2() > 0) {
            this.ndesbon = descuento.getNdesc2();
        }

        if (cantidad >= descuento.getNcant3() && descuento.getNcant3() > 0) {
            this.ndesbon = descuento.getNdesc3();
        }

        if (cantidad >= descuento.getNcant4() && descuento.getNcant4() > 0) {
            this.ndesbon = descuento.getNdesc4();
        }

    }

    public BigDecimal getSubtotal() {
        //Si tiene descuento Neto quito los descuentos
        //recalculo el nuevo subtotal
        BigDecimal cantidadsalida = new BigDecimal(ncanart);
        if (ncanart == 0) {
            if (ncanartm > 0) {
                cantidadsalida = new BigDecimal(ncanartm).divide(new BigDecimal(this.getExistencia().getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
            }
        }

        if (this.bneto) {
            nvaluni = Igv.valorVentaDetalleVenta(nvaluni, this.getExistencia().getIdproducto().getBinafecto());
            ndesfin = new BigDecimal("0.0");
            ndesbon = new BigDecimal("0.0");
            ndeslab = new BigDecimal("0.0");
            descuento.setNdesc1(new BigDecimal("0"));
            descuento.setNdesc2(new BigDecimal("0"));
            descuento.setNdesc3(new BigDecimal("0"));
            descuento.setNdesc4(new BigDecimal("0"));

            nsubtot = nvaluni.multiply(cantidadsalida);
            bneto = false;
        } else {
            if (ncanart == 0) {
                if (ncanartm > 0) {
                    nsubtot = nvalunim.multiply(cantidadsalida);
                }
            } else {
                nsubtot = nvaluni.multiply(cantidadsalida);
            }

            nsubtot = nsubtot.subtract(nsubtot.multiply(ndesfin.divide(new BigDecimal("100"))));
            nsubtot = nsubtot.subtract(nsubtot.multiply(ndesbon.divide(new BigDecimal("100"))));
            nsubtot = nsubtot.subtract(nsubtot.multiply(ndeslab.divide(new BigDecimal("100"))));
        }
//        verificaMargen();
        return nsubtot.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public MargenVenta verificaMargen() {
        MargenVenta margenventa = new MargenVenta();
        BigDecimal cantidadsalida = new BigDecimal(ncanart);
        if (ncanart == 0) {
            if (ncanartm > 0) {
                cantidadsalida = new BigDecimal(ncanartm).divide(new BigDecimal(this.getExistencia().getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
            }
        }

        BigDecimal valunineto = nsubtot.divide(cantidadsalida, 4, BigDecimal.ROUND_HALF_UP);
        BigDecimal utilidad = valunineto.subtract(ncosuni);
        BigDecimal margen = utilidad.multiply(Numero.cien);

        int rpta = ncosuni.compareTo(new BigDecimal("0"));
        //si rpta es 0 , son iguakes
        if (rpta != 0) {
            margen = margen.divide(ncosuni, 2, BigDecimal.ROUND_HALF_UP);
        }
        /// margen gerencia
        Integer rptanivel1 = margen.compareTo(nmargenminimo);
        //Si el margen es menor
        if (rptanivel1.equals(-1)) {
            margenventa.setBmargen(true);
            margenventa.setNmargen(margen);
            margenventa.setCmensaje("El producto: " + this.getExistencia().getIdproducto() + "\ntiene precio con MARGEN demasiado bajo\nImposible vender a este precio \nCominiquese con el Administrador ");
        }


        return margenventa;

    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNdesbon() {
        if (this.ndesbon == null) {
            ndesbon = new BigDecimal("0");
        }
        return ndesbon;
    }

    public void setNdesbon(BigDecimal ndesbon) {
        if (ndesbon == null) {
            ndesbon = new BigDecimal("0");
        }
        this.ndesbon = ndesbon;
    }

    public BigDecimal getNdesfin() {
        return ndesfin;
    }

    public void setNdesfin(BigDecimal ndesfin) {
        if (this.ndesfin == null) {
            ndesfin = new BigDecimal("0");
        }
        this.ndesfin = ndesfin;

    }

    public BigDecimal getNdeslab() {
        if (this.ndeslab == null) {
            ndeslab = new BigDecimal("0");
        }
        return ndeslab;
    }

    public void setNdeslab(BigDecimal ndeslab) {
        if (this.ndeslab == null) {
            ndeslab = new BigDecimal("0");
        }
//
        this.ndeslab = ndeslab;
    }

    public Integer getNstock() {
        if (this.nstock < 0) {
            this.nstock = 0;
        }
        return nstock;
    }

    public void setNstock(Integer nstock) {
        if (nstock == null) {
            nstock = 0;
        }
        this.nstock = nstock;
    }

    public BigDecimal getNsubtot() {

        BigDecimal cantidadsalida = new BigDecimal(ncanart);

        if (ncanart == 0) {
            if (ncanartm > 0) {
                cantidadsalida = new BigDecimal(ncanartm);
                nsubtot = nvalunim.multiply(cantidadsalida);
            }
        } else {
            nsubtot = nvaluni.multiply(cantidadsalida);
        }

        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesfin.divide(new BigDecimal("100"))));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesbon.divide(new BigDecimal("100"))));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndeslab.divide(new BigDecimal("100"))));
        
        return nsubtot.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public BigDecimal getNsubcos() {
        BigDecimal cantidadsalida = new BigDecimal(ncanart);
        if (ncanart == 0) {
            if (ncanartm > 0) {
                cantidadsalida = new BigDecimal(ncanartm).divide(new BigDecimal(this.getExistencia().getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
            }
        }

        nsubtot = ncosuni.multiply(cantidadsalida);
        return nsubtot.setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    public void setNsubtot(BigDecimal nsubtot) {
        this.nsubtot = nsubtot;
    }

    public Descuento getDescuento() {
        return descuento;
    }

    public void setDescuento(Descuento descuento) {
        this.descuento = descuento;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        if (nvaluni == null) {
            nvaluni = new BigDecimal("0");
        }
        this.nvaluni = nvaluni;
    }

    public BigDecimal getNmargenminimo() {
        return nmargenminimo;
    }

    public void setNmargenminimo(BigDecimal nmargenminimo) {
        this.nmargenminimo = nmargenminimo;
    }

    public Integer getNstktemporal() {
        return nstktemporal;
    }

    public void setNstktemporal(Integer nstktemporal) {
        this.nstktemporal = nstktemporal;
    }

    public Integer getIdindex() {
        return idindex;
    }

    public void setIdindex(Integer idindex) {
        this.idindex = idindex;
    }

    public Integer getIdventana() {
        return idventana;
    }

    public void setIdventana(Integer idventana) {
        this.idventana = idventana;
    }

    public Boolean getBneto() {
        return bneto;
    }

    public void setBneto(Boolean bneto) {
        this.bneto = bneto;
    }

    public boolean isBinafec() {
        return binafec;
    }

    public void setBinafec(boolean binafec) {
        this.binafec = binafec;
    }

    public BigDecimal getNigv() {
        if (this.isBinafec()) {
            return this.getNsubtot();
        } else {
            return Igv.igvDetalleVenta(this.getNsubtot());
        }

    }

    public void setNigv(BigDecimal nigv) {
        this.nigv = nigv;
    }

    public BigDecimal getNimporte() {
        if (this.isBinafec()) {
            return this.getNsubtot();
        } else {
            return Igv.importeDetalleVenta(this.getNsubtot(), this.isBinafec());
        }
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public String getCfecven() {
        return cfecven;
    }

    public void setCfecven(String cfecven) {
        this.cfecven = cfecven;
    }

    public String getCingreso() {
        return cingreso;
    }

    public void setCingreso(String cingreso) {
        this.cingreso = cingreso;
    }

    public String getCorigen() {
        return corigen;
    }

    public void setCorigen(String corigen) {
        this.corigen = corigen;
    }

    public Integer getNidregsalida() {
        return nidregsalida;
    }

    public void setNidregsalida(Integer nidregsalida) {
        this.nidregsalida = nidregsalida;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public BigDecimal getNdesfinmax() {
        return ndesfinmax;
    }

    public void setNdesfinmax(BigDecimal ndesfinmax) {
        this.ndesfinmax = ndesfinmax;
    }

    public Integer getNcanartm() {
        return ncanartm;
    }

    public void setNcanartm(Integer ncanartm) {    
//        calculaDescuentoEscala(ncanartm);
        this.ncanartm = ncanartm;
    }

    public Integer getNstockm() {
        return nstockm;
    }

    public void setNstockm(Integer nstockm) {
        this.nstockm = nstockm;
    }

    public BigDecimal getNvalunim() {
        return nvalunim;
    }

    public void setNvalunim(BigDecimal nvalunim) {
        this.nvalunim = nvalunim;
    }

    public boolean isBfraccion() {
        return bfraccion;
    }

    public void setBfraccion(boolean bfraccion) {
        this.bfraccion = bfraccion;
    }

    public boolean isBactivo() {
        return bactivo;
    }

    public void setBactivo(boolean bactivo) {
        this.bactivo = bactivo;
    }

    public Integer getNstockfraccion() {
        return nstockfraccion;
    }

    public void setNstockfraccion(Integer nstockfraccion) {
        this.nstockfraccion = nstockfraccion;
    }

    
    
    
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final DetalleVenta other = (DetalleVenta) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        if (this.nsubtot != other.nsubtot && (this.nsubtot == null || !this.nsubtot.equals(other.nsubtot))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (this.id != null ? this.id.hashCode() : 0);
        hash = 97 * hash + (this.nsubtot != null ? this.nsubtot.hashCode() : 0);
        return hash;
    }
}
