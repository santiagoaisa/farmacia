package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author saisa
 */
@Entity
@Table(name = "cheque_cliente")
@NamedQueries({
    @NamedQuery(name = "ChequeCliente.findAll", query = "SELECT c FROM ChequeCliente c"),
    @NamedQuery(name = "ChequeCliente.findByIdcheque", query = "SELECT c FROM ChequeCliente c WHERE c.idcheque=:idcheque"),
    @NamedQuery(name = "ChequeCliente.findByIdcliente", query = "SELECT c FROM ChequeCliente c WHERE c.idcliente.idcliente=:idcliente ORDER BY c.dfecha DESC")    
})
public class ChequeCliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcheque")
    private Integer idcheque;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    @JoinColumn(name = "idbanco", referencedColumnName = "idbanco")
    @ManyToOne(fetch = FetchType.EAGER)
    private Banco idbanco;
    @Column(name = "coperacion")
    private String coperacion;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "dfeccan")
    @Temporal(TemporalType.DATE)
    private Date dfeccan;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;

    public ChequeCliente() {
        nacuenta=new BigDecimal("0");
        nimporte=new BigDecimal("0");
        nsaldo=new BigDecimal("0");
    }

    public ChequeCliente(Integer idcheque) {
        this.idcheque = idcheque;
    }

    public Integer getIdcheque() {
        return idcheque;
    }

    public void setIdcheque(Integer idcheque) {
        this.idcheque = idcheque;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public String getCoperacion() {
        return coperacion;
    }

    public void setCoperacion(String coperacion) {
        this.coperacion = coperacion;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public BigDecimal getNacuenta() {
        return nacuenta;
    }

    public void setNacuenta(BigDecimal nacuenta) {
        this.nacuenta = nacuenta;
    }

    public BigDecimal getNsaldo() {
        return nsaldo;
    }

    public void setNsaldo(BigDecimal nsaldo) {
        this.nsaldo = nsaldo;
    }

    public Date getDfeccan() {
        return dfeccan;
    }

    public void setDfeccan(Date dfeccan) {
        this.dfeccan = dfeccan;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Banco getIdbanco() {
        return idbanco;
    }

    public void setIdbanco(Banco idbanco) {
        this.idbanco = idbanco;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcheque != null ? idcheque.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChequeCliente)) {
            return false;
        }
        ChequeCliente other = (ChequeCliente) object;
        if ((this.idcheque == null && other.idcheque != null) || (this.idcheque != null && !this.idcheque.equals(other.idcheque))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return coperacion;
    }
}
