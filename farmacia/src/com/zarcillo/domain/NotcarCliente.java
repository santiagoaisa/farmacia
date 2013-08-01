package com.zarcillo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "notcar_cliente")
@NamedQueries({
    @NamedQuery(name = "NotcarCliente.findAll", query = "SELECT n FROM NotcarCliente n")})
public class NotcarCliente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idnotcar")
    private Integer idnotcar;
    @Column(name = "dfecemi")
    @Temporal(TemporalType.DATE)
    private Date dfecemi;
    
      @JoinColumn(name = "idperiodo", referencedColumnName = "idperiodo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Periodo idperiodo;
      
        @JoinColumn(name = "idunidad", referencedColumnName = "idunidad")
    @ManyToOne(fetch = FetchType.EAGER)
    private UnidadNegocio idunidad;
    
    @Column(name = "cserie")
    private String cserie;
    @Column(name = "cnumero")
    private String cnumero;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "nafecto")
    private BigDecimal nafecto;
    @Column(name = "ninafecto")
    private BigDecimal ninafecto;
    @Column(name = "nigv")
    private BigDecimal nigv;
    @Column(name = "nimporte")
    private BigDecimal nimporte;
    @Column(name = "nredondeo")
    private BigDecimal nredondeo;
    @Column(name = "nacuenta")
    private BigDecimal nacuenta;
    @Column(name = "nsaldo")
    private BigDecimal nsaldo;
    @Column(name = "ncosto")
    private BigDecimal ncosto;
    
    
       @JoinColumn(name = "idcliente", referencedColumnName = "idcliente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente idcliente;
    
        @JoinColumn(name = "idmotivo", referencedColumnName = "idmotivo")
    @ManyToOne(fetch = FetchType.EAGER)
    private MotivoNotcarCliente idmotivo;
        
        @JoinColumn(name = "idvendedor", referencedColumnName = "idvendedor")
    @ManyToOne(fetch = FetchType.EAGER)
    private Vendedor idvendedor;
        
          @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
       
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public NotcarCliente() {
        nacuenta=new BigDecimal("0");
        nafecto=new BigDecimal("0");
        ncosto=new BigDecimal("0");
        nigv=new BigDecimal("0");
        nimporte=new BigDecimal("0");
        ninafecto=new BigDecimal("0");
        nredondeo=new BigDecimal("0");
        nsaldo=new BigDecimal("0");
    }

    public NotcarCliente(Integer idnotcar) {
        this.idnotcar = idnotcar;
    }

    public Integer getIdnotcar() {
        return idnotcar;
    }

    public void setIdnotcar(Integer idnotcar) {
        this.idnotcar = idnotcar;
    }

    public Date getDfecemi() {
        return dfecemi;
    }

    public void setDfecemi(Date dfecemi) {
        this.dfecemi = dfecemi;
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

    public BigDecimal getNafecto() {
        return nafecto;
    }

    public void setNafecto(BigDecimal nafecto) {
        this.nafecto = nafecto;
    }

    public BigDecimal getNinafecto() {
        return ninafecto;
    }

    public void setNinafecto(BigDecimal ninafecto) {
        this.ninafecto = ninafecto;
    }

    public BigDecimal getNigv() {
        return nigv;
    }

    public void setNigv(BigDecimal nigv) {
        this.nigv = nigv;
    }

    public BigDecimal getNimporte() {
        return nimporte;
    }

    public void setNimporte(BigDecimal nimporte) {
        this.nimporte = nimporte;
    }

    public BigDecimal getNredondeo() {
        return nredondeo;
    }

    public void setNredondeo(BigDecimal nredondeo) {
        this.nredondeo = nredondeo;
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

    public BigDecimal getNcosto() {
        return ncosto;
    }

    public void setNcosto(BigDecimal ncosto) {
        this.ncosto = ncosto;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

  

    public Vendedor getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Vendedor idvendedor) {
        this.idvendedor = idvendedor;
    }

    public MotivoNotcarCliente getIdmotivo() {
        return idmotivo;
    }

    public void setIdmotivo(MotivoNotcarCliente idmotivo) {
        this.idmotivo = idmotivo;
    }

    public Periodo getIdperiodo() {
        return idperiodo;
    }

    public void setIdperiodo(Periodo idperiodo) {
        this.idperiodo = idperiodo;
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
    
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idnotcar != null ? idnotcar.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotcarCliente)) {
            return false;
        }
        NotcarCliente other = (NotcarCliente) object;
        if ((this.idnotcar == null && other.idnotcar != null) || (this.idnotcar != null && !this.idnotcar.equals(other.idnotcar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cserie+"-"+cnumero;
    }
    
}
