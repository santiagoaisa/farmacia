package com.zarcillo.dto.almacen;

import com.zarcillo.domain.Producto;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Numero;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

public class DetalleIngreso implements Serializable {

    private Integer id;
    private String corden;
    private Producto idproducto;
    private Integer ncantidad;
    private Integer ncantidadm;
    private BigDecimal nvalven;
    private BigDecimal ncosuni;
    private BigDecimal ndesc1;
    private BigDecimal ndesc2;
    private BigDecimal nsubtot;
    //precio de la orden de compra
    private BigDecimal nprecio;
    private Boolean binafec;
    private Boolean batendido;
    private Integer naño;
    private Integer nmes;
    private String clote;
    private String cfecven;
    private String cdocumento;
    private String cserie;
    private String cnumero;
    private Boolean bneto;

    public DetalleIngreso() {
        ncantidad = 0;
        ncantidadm = 0;
        nvalven = new BigDecimal("0");
        ncosuni = new BigDecimal("0");
        ndesc1 = new BigDecimal("0");
        ndesc2 = new BigDecimal("0");
        nsubtot = new BigDecimal("0");
        nprecio = new BigDecimal("0");
        batendido = false;
        binafec = false;
        corden = "";
        clote = "";
        cfecven = "";
        nmes = 0;
        bneto = false;
    }

    public Integer getNcantidadm() {
        return ncantidadm;
    }

    public void setNcantidadm(Integer ncantidadm) {
        this.ncantidadm = ncantidadm;
    }

    public Boolean getBneto() {
        return bneto;
    }

    public void setBneto(Boolean bneto) {
        this.bneto = bneto;
    }

    public Boolean getBinafec() {
        return binafec;
    }

    public void setBinafec(Boolean binafec) {
        this.binafec = binafec;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCorden() {
        return corden;
    }

    public void setCorden(String corden) {
        this.corden = corden;
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

        if (ncantidad == null) {
            ncantidad = 0;
        }

        this.ncantidad = ncantidad;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {

        if (ncosuni == null) {
            ncosuni = new BigDecimal("0");
        }

        this.ncosuni = ncosuni;
    }

    public BigDecimal getNdesc1() {
        return ndesc1;
    }

    public void setNdesc1(BigDecimal ndesc1) {
        if (ndesc1 == null) {
            ndesc1 = new BigDecimal("0");
        }

        this.ndesc1 = ndesc1;
    }

    public BigDecimal getNdesc2() {
        return ndesc2;
    }

    public void setNdesc2(BigDecimal ndesc2) {
        if (ndesc2 == null) {
            ndesc2 = new BigDecimal("0");
        }

        this.ndesc2 = ndesc2;
    }

    public Boolean getBatendido() {
        return batendido;
    }

    public void setBatendido(Boolean batendido) {
        this.batendido = batendido;
    }

    public BigDecimal getNprecio() {
        return nprecio;
    }

    public void setNprecio(BigDecimal nprecio) {
        if (nprecio == null) {
            nprecio = new BigDecimal("0");
        }

        this.nprecio = nprecio;
    }

    public BigDecimal getNsubtotal() {
        return nsubtot.setScale(4, BigDecimal.ROUND_HALF_UP);

    }

    public BigDecimal getNsubtot() {
        Integer cantidadentrada = ncantidad;
        if (ncantidad == 0) {
            if (ncantidadm != 0) {
                cantidadentrada = ncantidadm;
            }
        }

        nsubtot = ncosuni.multiply(BigDecimal.valueOf(cantidadentrada));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesc1.divide(new BigDecimal("100"))));
        nsubtot = nsubtot.subtract(nsubtot.multiply(ndesc2.divide(new BigDecimal("100"))));

        return nsubtot.setScale(4, BigDecimal.ROUND_HALF_UP);
    }

    public void calculaNeto() {
        if (this.bneto) {


            BigDecimal valorventa = Igv.valorVentaDetalleVenta(nsubtot, this.getIdproducto().getBinafecto());

            if (!Numero.isCero(nsubtot)) {

                Integer cantidadentrada = ncantidad;
                if (ncantidad == 0) {
                    if (getIdproducto().getNmenudeo()>0) {
                        cantidadentrada = ncantidadm;
                    }
                }

                setNcosuni(valorventa.divide(new BigDecimal(cantidadentrada), 4, BigDecimal.ROUND_HALF_EVEN));
                setNdesc1(new BigDecimal("0"));
                setNdesc2(new BigDecimal("0"));
                setNsubtot(ncosuni.multiply(new BigDecimal(cantidadentrada)));
                setBneto(false);
            }

        }

    }

    public void setNsubtot(BigDecimal nsubtot) {
        if (nsubtot == null) {
            nsubtot = new BigDecimal("0");
        }

        this.nsubtot = nsubtot;

        if (ncantidad == 0) {
            this.ncosuni = new BigDecimal("0");
        } else {
            this.ncosuni = nsubtot.divide(BigDecimal.valueOf(ncantidad), 4, BigDecimal.ROUND_HALF_UP);
        }

        this.ndesc1 = new BigDecimal("0");
        this.ndesc2 = new BigDecimal("0");


    }

    public BigDecimal getNvalven() {
        return nvalven;
    }

    public void setNvalven(BigDecimal nvalven) {
        if (nvalven == null) {
            nvalven = new BigDecimal("0");
        }

        this.nvalven = nvalven;
    }

    public Integer getNaño() {
        return naño;
    }

    public void setNaño(Integer naño) {
        this.naño = naño;
    }

    public Integer getNmes() {
        return nmes;
    }

    public void setNmes(Integer nmes) {
        this.nmes = nmes;
    }

    public String getCfecven() {
        if (cfecven == null) {
            cfecven = "";
        }

        return cfecven;
    }

    public void setCfecven(String cfecven) {
        this.cfecven = cfecven;
    }

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

    public String getCdocumento() {
        return cdocumento;
    }

    public void setCdocumento(String cdocumento) {
        this.cdocumento = cdocumento;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
    }

    public String getCserie() {
        return cserie;
    }

    public void setCserie(String cserie) {
        this.cserie = cserie;
    }
}
