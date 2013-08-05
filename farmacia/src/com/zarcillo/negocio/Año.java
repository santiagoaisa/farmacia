package com.zarcillo.negocio;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "util.ano")
public class Año implements Serializable {

    @Id
    private Integer nano;   

    public Año() {
    }

    public Integer getNano() {
        return nano;
    }

    public void setNano(Integer nano) {
        this.nano = nano;
    }

   
}
