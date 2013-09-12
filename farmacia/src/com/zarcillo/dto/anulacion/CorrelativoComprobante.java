package com.zarcillo.dto.anulacion;

import com.zarcillo.domain.Documento;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author saisa
 */

@Entity
@Table(name = "util.correlativocomprobante")
public class CorrelativoComprobante implements Serializable {

    @Id
    private Integer id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dfecha;
    
     @JoinColumn(name = "iddocumento", referencedColumnName = "iddocumento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Documento iddocumento;
    
    private String cserie;
    private String cnumero;

    public CorrelativoComprobante() {

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDfecha() {
        return dfecha;
    }

    public void setDfecha(Date dfecha) {
        this.dfecha = dfecha;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.iddocumento);
        hash = 41 * hash + Objects.hashCode(this.cserie.trim());
        hash = 41 * hash + Objects.hashCode(this.cnumero.trim());
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CorrelativoComprobante other = (CorrelativoComprobante) obj;
        if (!Objects.equals(this.iddocumento, other.iddocumento)) {
            return false;
        }
        if (!Objects.equals(this.cserie.trim(), other.cserie.trim())) {
            return false;
        }
        
        if (!Objects.equals(this.cnumero.trim(), other.cnumero.trim())) {
            return false;
        }
        return true;
    }

   

}
