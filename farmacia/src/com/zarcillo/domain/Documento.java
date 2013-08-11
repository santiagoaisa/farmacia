package com.zarcillo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "documento")
@NamedQueries({
    @NamedQuery(name = "Documento.findAll", query = "SELECT d FROM Documento d ORDER BY d.ccodigosunat "),
    @NamedQuery(name = "Documento.findByCcodigosunat", query = "SELECT d FROM Documento d WHERE d.ccodigosunat=:ccodigosunat ORDER BY d.ccodigosunat "),
    @NamedQuery(name = "Documento.findByBcompra", query = "SELECT d FROM Documento d WHERE d.bcompra=true ORDER BY d.ccodigosunat "),
    @NamedQuery(name = "Documento.findByBventa", query = "SELECT d FROM Documento d WHERE d.bventa=true ORDER BY d.ccodigosunat "),
    @NamedQuery(name = "Documento.findByBpago", query = "SELECT d FROM Documento d WHERE d.bpago=true ORDER BY d.ccodigosunat "),
    @NamedQuery(name = "Documento.findByIddocumento", query = "SELECT d FROM Documento d WHERE d.iddocumento=:iddocumento")
})
public class Documento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddocumento")
    private Integer iddocumento;
    @Column(name = "cnomdocumento")
    private String cnomdocumento;
    @Column(name = "bcompra")
    private Boolean bcompra;
    @Column(name = "bventa")
    private Boolean bventa;
    @Column(name = "bpago")
    private Boolean bpago;
    @Column(name = "ccodigosunat")
    private String ccodigosunat;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "cabrev")
    private String cabrev;
   
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
     @Column(name = "nitems")
    private Integer nitems;
    public static Documento TRANSFERENCIA_SUNAT=new Documento("00");
    public static Documento LETRA_SUNAT=new Documento("99");
    public static Documento FACTURA_SUNAT=new Documento("01");
    public static Documento BOLETA_SUNAT=new Documento("03");
    public static Documento NOTA_CREDITO_SUNAT=new Documento("07");
    public static Documento NOTA_DEBITO_SUNAT=new Documento("08");
    public static Documento GUIA_REMISION_SUNAT=new Documento("09");

    public Documento(String ccodigosunat) {
        this.ccodigosunat = ccodigosunat;
        nitems=0;
        bcompra = false;
        bpago = false;
        bventa = false;
    }
    
    
    

    public Documento() {
        nitems=0;
        bcompra = false;
        bpago = false;
        bventa = false;
       
    }

    public Documento(Integer iddocumento) {
        this.iddocumento = iddocumento;
    }

    public Integer getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Integer iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getCnomdocumento() {
        return cnomdocumento;
    }

    public void setCnomdocumento(String cnomdocumento) {
        this.cnomdocumento = cnomdocumento;
    }

    public Boolean getBcompra() {
        return bcompra;
    }

    public void setBcompra(Boolean bcompra) {
        this.bcompra = bcompra;
    }

    public Boolean getBventa() {
        return bventa;
    }

    public void setBventa(Boolean bventa) {
        this.bventa = bventa;
    }

    public String getCcodigosunat() {
        return ccodigosunat;
    }

    public void setCcodigosunat(String ccodigosunat) {
        this.ccodigosunat = ccodigosunat;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Boolean getBpago() {
        return bpago;
    }

    public void setBpago(Boolean bpago) {
        this.bpago = bpago;
    }

    public String getCabrev() {
        return cabrev;
    }

    public void setCabrev(String cabrev) {
        this.cabrev = cabrev;
    }

    public Integer getNitems() {
        return nitems;
    }

    public void setNitems(Integer nitems) {
        this.nitems = nitems;
    }

    

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddocumento != null ? iddocumento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Documento)) {
            return false;
        }
        Documento other = (Documento) object;
        if ((this.iddocumento == null && other.iddocumento != null) || (this.iddocumento != null && !this.iddocumento.equals(other.iddocumento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomdocumento;
    }
}
