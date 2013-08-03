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
@Table(name = "menu")
@NamedQueries({
    @NamedQuery(name = "Menu.findAll", query = "SELECT m FROM Menu m"),
    @NamedQuery(name = "Menu.findByIdmenu", query = "SELECT m FROM Menu m WHERE m.idmenu=:idmenu"),
    @NamedQuery(name = "Menu.findByIdmoduloByNnivel1", query = "SELECT m FROM Menu m WHERE m.idmodulo.idmodulo=:idmodulo and m.nnivel1=:nnivel ORDER BY m.norden "),
    @NamedQuery(name = "Menu.findByIdmodulo", query = "SELECT m FROM Menu m WHERE m.idmodulo.idmodulo=:idmodulo ORDER BY m.norden ")
})
public class Menu implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmenu")
    private Integer idmenu;
    @Column(name = "cnommenu")
    private String cnommenu;
    @Column(name = "cruta")
    private String cruta;
    @Column(name = "nnivel1")
    private Integer nnivel1;
    @Column(name = "nnivel2")
    private Integer nnivel2;
    @Column(name = "nnivel3")
    private Integer nnivel3;
    @Column(name = "norden")
    private Integer norden;
    @Column(name = "bmodal")
    private Boolean bmodal;
    
    
    @JoinColumn(name = "idmodulo", referencedColumnName = "idmodulo")
    @ManyToOne(fetch = FetchType.EAGER)
    private Modulo idmodulo;
    
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario idusuario;
    
    @Column(name = "dfecreg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dfecreg;

    public Menu() {
        nnivel1=0;
        nnivel2=0;
        nnivel3=0;
        norden=0;
        bmodal=false;
    }

    public Menu(Integer idmenu) {
        this.idmenu = idmenu;
    }

    public Integer getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(Integer idmenu) {
        this.idmenu = idmenu;
    }

    public String getCnommenu() {
        return cnommenu;
    }

    public void setCnommenu(String cnommenu) {
        this.cnommenu = cnommenu;
    }

    public String getCruta() {
        return cruta;
    }

    public void setCruta(String cruta) {
        this.cruta = cruta;
    }

    public Integer getNnivel1() {
        return nnivel1;
    }

    public void setNnivel1(Integer nnivel1) {
        this.nnivel1 = nnivel1;
    }

    public Integer getNnivel2() {
        return nnivel2;
    }

    public void setNnivel2(Integer nnivel2) {
        this.nnivel2 = nnivel2;
    }

    public Integer getNnivel3() {
        return nnivel3;
    }

    public void setNnivel3(Integer nnivel3) {
        this.nnivel3 = nnivel3;
    }

    public Integer getNorden() {
        return norden;
    }

    public void setNorden(Integer norden) {
        this.norden = norden;
    }

    public Boolean getBmodal() {
        return bmodal;
    }

    public void setBmodal(Boolean bmodal) {
        this.bmodal = bmodal;
    }

    public Date getDfecreg() {
        return dfecreg;
    }

    public void setDfecreg(Date dfecreg) {
        this.dfecreg = dfecreg;
    }

    

    public Modulo getIdmodulo() {
        return idmodulo;
    }

    public void setIdmodulo(Modulo idmodulo) {
        this.idmodulo = idmodulo;
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
        hash += (idmenu != null ? idmenu.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Menu)) {
            return false;
        }
        Menu other = (Menu) object;
        if ((this.idmenu == null && other.idmenu != null) || (this.idmenu != null && !this.idmenu.equals(other.idmenu))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return cnommenu;
    }
    
}
