package com.zarcillo.dto.almacen;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

@Entity
@Table(name = "util.kardex")

public class Kardex implements Serializable {

    @Id
    private Integer id;
    private Integer nnro;
    private Integer ndia;

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dfecmov;
    private String cabrev;
    private String cserfac;
    private String cfactura;
    private String csergui;
    private String cguia;
    private String ctipmov;
    private String idcodigo;
    private String cnombre;
    
    private Integer ncompra;
    private Integer nventa;
    private Integer nsaldo;
    
    private Integer ncompram;
    private Integer nventam;
    private Integer nsaldom;

    private String clote;
    private String cfecven;

    private Integer nregsalida;
    private Integer nregentrada;
    private Integer noperacion;
    ///
    private BigDecimal ncosuni;
    private BigDecimal nimporteentrada;
    private BigDecimal nimportesalida;
    private BigDecimal nimportesaldo;

    private BigDecimal ndesfin;
    private BigDecimal ndesbon;
    private BigDecimal ndeslab;

    private BigDecimal nvaluni;
    private String idtransportista;
    private Boolean  banulado;
    private Boolean  bdevuelto;
    private Boolean  bresumen;
    private String  cnomdistrito;
    private String  cnomprovincia;
    private String  cnomdepartamento;


    public Kardex() {
        nnro=0;
        ncompra=0;
        nventa=0;
        nsaldo=0;
        
        ncompram=0;
        nventam=0;
        nsaldom=0;
        
        ncosuni=new BigDecimal("0");
        nimporteentrada=new BigDecimal("0");
        nimportesalida=new BigDecimal("0");
        nimportesaldo=new BigDecimal("0");
        ndesfin=new BigDecimal("0");
        ndesbon=new BigDecimal("0");
        ndeslab=new BigDecimal("0");
        nvaluni=new BigDecimal("0");
        banulado=false;
        bdevuelto=false;
        bresumen=false;
    }

    public Integer getNoperacion() {
        return noperacion;
    }

    public void setNoperacion(Integer noperacion) {
        this.noperacion = noperacion;
    }



    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
    }

    public String getCserfac() {
        return cserfac;
    }

    public void setCserfac(String cserfac) {
        this.cserfac = cserfac;
    }

    public String getCsergui() {
        return csergui;
    }

    public void setCsergui(String csergui) {
        this.csergui = csergui;
    }




    



    public String getCfactura() {
        return cfactura;
    }

    public void setCfactura(String cfactura) {
        this.cfactura = cfactura;
    }

    public String getCguia() {
        return cguia;
    }

    public void setCguia(String cguia) {
        this.cguia = cguia;
    }

    public String getClote() {
        return clote;
    }

    public void setClote(String clote) {
        this.clote = clote;
    }

    public String getCnombre() {
        return cnombre;
    }

    public void setCnombre(String cnombre) {
        this.cnombre = cnombre;
    }

    public Date getDfecmov() {
        return dfecmov;
    }

    public void setDfecmov(Date dfecmov) {
        this.dfecmov = dfecmov;
    }

    public String getCfecven() {
        return cfecven;
    }

    public void setCfecven(String cfecven) {
        this.cfecven = cfecven;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNcompra() {
        return ncompra;
    }

    public void setNcompra(Integer ncompra) {
        this.ncompra = ncompra;
    }

    public Integer getNnro() {
        return nnro;
    }

    public void setNnro(Integer nnro) {
        this.nnro = nnro;
    }

    public Integer getNdia() {
        return ndia;
    }

    public void setNdia(Integer ndia) {
        this.ndia = ndia;
    }

    

    public Integer getNregentrada() {
        return nregentrada;
    }

    public void setNregentrada(Integer nregentrada) {
        this.nregentrada = nregentrada;
    }

    public Integer getNregsalida() {
        return nregsalida;
    }

    public void setNregsalida(Integer nregsalida) {
        this.nregsalida = nregsalida;
    }

    public Integer getNsaldo() {
        return nsaldo;
    }

    public void setNsaldo(Integer nsaldo) {
        this.nsaldo = nsaldo;
    }

    public Integer getNventa() {
        return nventa;
    }

    public void setNventa(Integer nventa) {
        this.nventa = nventa;
    }

    

    public String getCtipmov() {
        return ctipmov;
    }

    public void setCtipmov(String ctipmov) {
        this.ctipmov = ctipmov;
    }

    public BigDecimal getNcosuni() {
        return ncosuni;
    }

    public void setNcosuni(BigDecimal ncosuni) {
        this.ncosuni = ncosuni;
    }

    public BigDecimal getNimporteentrada() {
        return nimporteentrada;
    }

    public void setNimporteentrada(BigDecimal nimporteentrada) {
        this.nimporteentrada = nimporteentrada;
    }

    public BigDecimal getNimportesalida() {
        return nimportesalida;
    }

    public void setNimportesalida(BigDecimal nimportesalida) {
        this.nimportesalida = nimportesalida;
    }

    public BigDecimal getNimportesaldo() {
        return nimportesaldo;
    }

    public void setNimportesaldo(BigDecimal nimportesaldo) {
        this.nimportesaldo = nimportesaldo;
    }

    public BigDecimal getNdesbon() {
        return ndesbon;
    }

    public void setNdesbon(BigDecimal ndesbon) {
        this.ndesbon = ndesbon;
    }

    public BigDecimal getNdesfin() {
        return ndesfin;
    }

    public void setNdesfin(BigDecimal ndesfin) {
        this.ndesfin = ndesfin;
    }

    public BigDecimal getNdeslab() {
        return ndeslab;
    }

    public void setNdeslab(BigDecimal ndeslab) {
        this.ndeslab = ndeslab;
    }

    public BigDecimal getNvaluni() {
        return nvaluni;
    }

    public void setNvaluni(BigDecimal nvaluni) {
        this.nvaluni = nvaluni;
    }

    public String getIdtransportista() {
        return idtransportista;
    }

    public void setIdtransportista(String idtransportista) {
        this.idtransportista = idtransportista;
    }

    public String getIdcodigo() {
        return idcodigo;
    }

    public void setIdcodigo(String idcodigo) {
        this.idcodigo = idcodigo;
    }

    public boolean isBanulado() {
        return banulado;
    }

    public void setBanulado(boolean banulado) {
        this.banulado = banulado;
    }

    public boolean isBdevuelto() {
        return bdevuelto;
    }

    public void setBdevuelto(boolean bdevuelto) {
        this.bdevuelto = bdevuelto;
    }

    public boolean isBresumen() {
        return bresumen;
    }

    public void setBresumen(boolean bresumen) {
        this.bresumen = bresumen;
    }

    public String getCnomdepartamento() {
        return cnomdepartamento;
    }

    public void setCnomdepartamento(String cnomdepartamento) {
        this.cnomdepartamento = cnomdepartamento;
    }

    public String getCnomdistrito() {
        return cnomdistrito;
    }

    public void setCnomdistrito(String cnomdistrito) {
        this.cnomdistrito = cnomdistrito;
    }

    public String getCnomprovincia() {
        return cnomprovincia;
    }

    public void setCnomprovincia(String cnomprovincia) {
        this.cnomprovincia = cnomprovincia;
    }

    public Integer getNcompram() {
        return ncompram;
    }

    public void setNcompram(Integer ncompram) {
        this.ncompram = ncompram;
    }

    public Integer getNventam() {
        return nventam;
    }

    public void setNventam(Integer nventam) {
        this.nventam = nventam;
    }

    public Integer getNsaldom() {
        return nsaldom;
    }

    public void setNsaldom(Integer nsaldom) {
        this.nsaldom = nsaldom;
    }

    public Boolean getBanulado() {
        return banulado;
    }

    public void setBanulado(Boolean banulado) {
        this.banulado = banulado;
    }


   




}
