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
@Table(name = "tipo_pago")
@NamedQueries({
    @NamedQuery(name = "TipoPago.findAll", query = "SELECT t FROM TipoPago t ORDER BY t.cnomtipo"),
    @NamedQuery(name = "TipoPago.findByCcodigosunat", query = "SELECT t FROM TipoPago t WHERE t.ccodigosunat =:ccodigosunat"),
    @NamedQuery(name = "TipoPago.findByBcobro", query = "SELECT t FROM TipoPago t WHERE t.bcobro=true ORDER BY t.cnomtipo "),
    @NamedQuery(name = "TipoPago.findByBpago", query = "SELECT t FROM TipoPago t WHERE t.bpago=true ORDER BY t.cnomtipo "),
    @NamedQuery(name = "TipoPago.findByIdtipo", query = "SELECT t FROM TipoPago t WHERE t.idtipo=:idtipo")
})
public class TipoPago implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipo")
    private Integer idtipo;
    @Column(name = "cnomtipo")
    private String cnomtipo;
    @Column(name = "ccodigosunat")
    private String ccodigosunat;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "bcobro")
    private Boolean bcobro;
    @Column(name = "bpago")
    private Boolean bpago;
    
    public static TipoPago DEPOSITO_SUNAT = new TipoPago("001");
    public static TipoPago TRANSFERENCIA_SUNAT = new TipoPago("003");
    public static TipoPago TARJETA_DEBITO_SUNAT = new TipoPago("005");
    public static TipoPago TARJETA_CREDITO_SUNAT = new TipoPago("006");
    public static TipoPago CHEQUE_SUNAT = new TipoPago("007");
    public static TipoPago EFECTIVO_SUNAT = new TipoPago("009");
    public static TipoPago LETRA_CAMBIO_SUNAT = new TipoPago("011");
    public static TipoPago NOTA_CREDITO_SUNAT = new TipoPago("051");
    public static TipoPago NOTA_DEBITO_SUNAT = new TipoPago("052");
    public static TipoPago REDONDEO_SUNAT = new TipoPago("053");
    public static TipoPago RETENCION_SUNAT = new TipoPago("054");

    public TipoPago() {
        bcobro = false;
        bpago = false;
    }

    public TipoPago(String ccodigosunat) {
        this.ccodigosunat = ccodigosunat;
    }

    public TipoPago(Integer idtipo) {
        this.idtipo = idtipo;
    }

    public Integer getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(Integer idtipo) {
        this.idtipo = idtipo;
    }

    public String getCnomtipo() {
        return cnomtipo;
    }

    public void setCnomtipo(String cnomtipo) {
        this.cnomtipo = cnomtipo;
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

    public Boolean getBcobro() {
        return bcobro;
    }

    public void setBcobro(Boolean bcobro) {
        this.bcobro = bcobro;
    }

    public Boolean getBpago() {
        return bpago;
    }

    public void setBpago(Boolean bpago) {
        this.bpago = bpago;
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
        hash += (idtipo != null ? idtipo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoPago)) {
            return false;
        }
        TipoPago other = (TipoPago) object;
        if ((this.idtipo == null && other.idtipo != null) || (this.idtipo != null && !this.idtipo.equals(other.idtipo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnomtipo;
    }
}
