package com.zarcillo.domain;

import java.io.Serializable;
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
@Table(name = "transferencia")
@NamedQueries({
    @NamedQuery(name = "Transferencia.findAll", query = "SELECT t FROM Transferencia t")})
public class Transferencia implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtransferencia")
    private Integer idtransferencia;
    @Column(name = "dfecha")
    @Temporal(TemporalType.DATE)
    private Date dfecha;
    
     @JoinColumn(name = "idalmacen", referencedColumnName = "idalmacen")
    @ManyToOne(fetch = FetchType.EAGER)
    private Almacen idalmacen;
     
     @JoinColumn(name = "idregsalida", referencedColumnName = "idregsalida")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroSalida idregsalida;
     
     @JoinColumn(name = "idregentrada", referencedColumnName = "idregentrada")
    @ManyToOne(fetch = FetchType.EAGER)
    private RegistroEntrada idregentrada;
    
     @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    
     @Column(name = "cobservacion")
    private String cobservacion;

    public Transferencia() {
    }

    public Transferencia(Integer idtransferencia) {
        this.idtransferencia = idtransferencia;
    }

    public Integer getIdtransferencia() {
        return idtransferencia;
    }

    public void setIdtransferencia(Integer idtransferencia) {
        this.idtransferencia = idtransferencia;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public String getCserie() {
        return cserie;
    }

    public void setCserie(String cserie) {
        this.cserie = cserie;
    }

    public String getCnumero() {
        return cnumero;
    }

    public void setCnumero(String cnumero) {
        this.cnumero = cnumero;
    }

    public String getCobservacion() {
        return cobservacion;
    }

    public void setCobservacion(String cobservacion) {
        this.cobservacion = cobservacion;
    }

    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtransferencia != null ? idtransferencia.hashCode() : 0);
        return hash;
    }

    public Almacen getIdalmacen() {
        return idalmacen;
    }

    public void setIdalmacen(Almacen idalmacen) {
        this.idalmacen = idalmacen;
    }

    public RegistroSalida getIdregsalida() {
        return idregsalida;
    }

    public void setIdregsalida(RegistroSalida idregsalida) {
        this.idregsalida = idregsalida;
    }

    public RegistroEntrada getIdregentrada() {
        return idregentrada;
    }

    public void setIdregentrada(RegistroEntrada idregentrada) {
        this.idregentrada = idregentrada;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    
    
    
    
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transferencia)) {
            return false;
        }
        Transferencia other = (Transferencia) object;
        if ((this.idtransferencia == null && other.idtransferencia != null) || (this.idtransferencia != null && !this.idtransferencia.equals(other.idtransferencia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cserie+"-"+cnumero;
    }
    
}
