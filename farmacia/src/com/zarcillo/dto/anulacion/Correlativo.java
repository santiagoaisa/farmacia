package com.zarcillo.dto.anulacion;

import com.zarcillo.domain.Documento;
import java.io.Serializable;
import java.util.Date;



public class Correlativo implements Serializable {
    private Date dfecha;    
    private Documento iddocumento;        
    private String cserie;
    private String cnumero;
    public Correlativo() {

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
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Correlativo other = (Correlativo) obj;
        if ((this.cserie == null) ? (other.cserie != null) : !this.cserie.equals(other.cserie)) {
            return false;
        }
        if ((this.cnumero == null) ? (other.cnumero != null) : !this.cnumero.equals(other.cnumero)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 13 * hash + (this.cserie != null ? this.cserie.hashCode() : 0);
        hash = 17 * hash + (this.cnumero != null ? this.cnumero.hashCode() : 0);
        return hash;
    }



}
