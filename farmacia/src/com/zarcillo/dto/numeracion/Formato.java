package com.zarcillo.dto.numeracion;


import com.zarcillo.domain.Documento;
import java.io.Serializable;


public class Formato implements Serializable {
    private Integer id;
    private Integer nnumero;
    private String  creporte;
    private String  cimagen;
    private Documento iddocumento;


    public Formato() {
    }

    public String getCimagen() {
        return cimagen;
    }

    public void setCimagen(String cimagen) {
        this.cimagen = cimagen;
    }

    public String getCreporte() {
        return creporte;
    }

    public void setCreporte(String creporte) {
        this.creporte = creporte;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

   
    

    

    public Integer getNnumero() {
        return nnumero;
    }

    public void setNnumero(Integer nnumero) {
        this.nnumero = nnumero;
    }

    public Documento getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(Documento iddocumento) {
        this.iddocumento = iddocumento;
    }

    



}
