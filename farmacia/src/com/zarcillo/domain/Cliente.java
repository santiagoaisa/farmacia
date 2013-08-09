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
@Table(name = "cliente")
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c"),
    @NamedQuery(name = "Cliente.findByIdcliente", query = "SELECT c FROM Cliente c WHERE c.idcliente=:idcliente"),
    @NamedQuery(name = "Cliente.findByIdunidadByIdcliente", query = "SELECT c FROM Cliente c WHERE c.idunidad.idunidad=:idunidad and c.idcliente=:idcliente"),
    @NamedQuery(name = "Cliente.findByIdunidad", query = "SELECT c FROM Cliente c WHERE c.idunidad.idunidad=:idunidad "),
    @NamedQuery(name = "Cliente.findByIdunidadByCnomcli", query = "SELECT c FROM Cliente c WHERE c.idunidad.idunidad=:idunidad and c.cnomcli LIKE :cnomcli ORDER BY c.cnomcli  ")
})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcliente")
    private Integer idcliente;
    @Column(name = "cnomcli")
    private String cnomcli;
    @Column(name = "ccomercial")
    private String ccomercial;
    @Column(name = "cruc")
    private String cruc;
    @Column(name = "cdni")
    private String cdni;
    @Column(name = "cdircli")
    private String cdircli;
    @Column(name = "ctelefono")
    private String ctelefono;
    @Column(name = "cfax")
    private String cfax;
    @Column(name = "cmovil")
    private String cmovil;
    @Column(name = "ccorreo")
    private String ccorreo;
    @Column(name = "creferencia")
    private String creferencia;
    @Column(name = "bagenteretencion")
    private Boolean bagenteretencion;
    @Column(name = "bbloqueado")
    private Boolean bbloqueado;
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    @JoinColumn(name = "idubigeo", referencedColumnName = "idubigeo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Ubigeo idubigeo;
    @JoinColumn(name = "idtipo", referencedColumnName = "idtipo")
    @ManyToOne(fetch = FetchType.EAGER)
    private TipoPersona idtipo;

    public Cliente() {
        bagenteretencion = false;
        bbloqueado = false;
    }

    public Cliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public String getCnomcli() {
        return cnomcli;
    }

    public void setCnomcli(String cnomcli) {
        this.cnomcli = cnomcli;
    }

    public String getCcomercial() {
        return ccomercial;
    }

    public void setCcomercial(String ccomercial) {
        this.ccomercial = ccomercial;
    }

    public String getCruc() {
        return cruc;
    }

    public void setCruc(String cruc) {
        this.cruc = cruc;
    }

    public String getCdni() {
        return cdni;
    }

    public void setCdni(String cdni) {
        this.cdni = cdni;
    }

    public String getCdircli() {
        return cdircli;
    }

    public void setCdircli(String cdircli) {
        this.cdircli = cdircli;
    }

    public String getCtelefono() {
        return ctelefono;
    }

    public void setCtelefono(String ctelefono) {
        this.ctelefono = ctelefono;
    }

    public String getCfax() {
        return cfax;
    }

    public void setCfax(String cfax) {
        this.cfax = cfax;
    }

    public String getCmovil() {
        return cmovil;
    }

    public void setCmovil(String cmovil) {
        this.cmovil = cmovil;
    }

    public String getCcorreo() {
        return ccorreo;
    }

    public void setCcorreo(String ccorreo) {
        this.ccorreo = ccorreo;
    }

    public String getCreferencia() {
        return creferencia;
    }

    public void setCreferencia(String creferencia) {
        this.creferencia = creferencia;
    }

    public Boolean getBagenteretencion() {
        return bagenteretencion;
    }

    public void setBagenteretencion(Boolean bagenteretencion) {
        this.bagenteretencion = bagenteretencion;
    }

    public Boolean getBbloqueado() {
        return bbloqueado;
    }

    public void setBbloqueado(Boolean bbloqueado) {
        this.bbloqueado = bbloqueado;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    public UnidadNegocio getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(UnidadNegocio idunidad) {
        this.idunidad = idunidad;
    }

    public Ubigeo getIdubigeo() {
        return idubigeo;
    }

    public void setIdubigeo(Ubigeo idubigeo) {
        this.idubigeo = idubigeo;
    }

    public TipoPersona getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(TipoPersona idtipo) {
        this.idtipo = idtipo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcliente != null ? idcliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.idcliente == null && other.idcliente != null) || (this.idcliente != null && !this.idcliente.equals(other.idcliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        String cadena = this.getCnomcli();


        if (this.getIdtipo().getCcodigosunat().contains(TipoPersona.JURIDICA_SUNAT.getCcodigosunat())) {
            cadena = this.getCnomcli();
        } else {

            if (this.getCcomercial() != null) {
                if (!getCcomercial().trim().isEmpty()) {
                    cadena = this.getCcomercial();
                } else {
                    cadena = this.getCnomcli();
                }
            } else {
                cadena = this.getCnomcli();
            }


        }
        return cadena.trim();
    }
}
