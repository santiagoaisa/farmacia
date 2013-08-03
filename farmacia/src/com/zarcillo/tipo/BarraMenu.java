package com.zarcillo.tipo;

import java.io.Serializable;
import java.util.Objects;


public class BarraMenu implements Serializable {

    private Integer nnivel;
    private String cdescripcion;

    public static BarraMenu ARCHIVOS=new BarraMenu(1,"Archivos");
    public static BarraMenu PROCESOS=new BarraMenu(2,"Procesos");
    public static BarraMenu CONSULTAS=new BarraMenu(3,"Consultas");
    public static BarraMenu HERRAMIENTAS=new BarraMenu(4,"Herramientas");

    public BarraMenu() {
    }

    public BarraMenu(Integer nnivel) {
        this.nnivel = nnivel;
    }

    public BarraMenu(Integer nnivel, String cdescripcion) {
        this.nnivel = nnivel;
        this.cdescripcion = cdescripcion;
    }

    

 



    public String getCdescripcion() {
        return cdescripcion;
    }

    public void setCdescripcion(String cdescripcion) {
        this.cdescripcion = cdescripcion;
    }

    public Integer getNnivel() {
        return nnivel;
    }

    public void setNnivel(Integer nnivel) {
        this.nnivel = nnivel;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.nnivel);
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
        final BarraMenu other = (BarraMenu) obj;
        if (!Objects.equals(this.nnivel, other.nnivel)) {
            return false;
        }
        return true;
    }

   

    

    @Override
    public String toString() {
        return cdescripcion ;
    }


}