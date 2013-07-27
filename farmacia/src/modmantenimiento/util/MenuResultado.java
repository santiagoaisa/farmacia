package modmantenimiento.util;

import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Window;

public class MenuResultado extends Window {
    //controles
    private Label resultado;
    private Image imagen;
    //variables
    private Integer size;

    public MenuResultado() {
        size=0;
    }

    public void onCreate() {
        initcomponentes();
    }

    private void initcomponentes() {
        resultado = (Label) getFellow("resultado");
        imagen=(Image)getFellow("imagen");
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
        escribir();
    }

    private void escribir(){
        if(this.getSize()>0){
            imagen.setSrc("/img/Search.png");
        }else{
            imagen.setSrc("/img/Error.png");
        }
        resultado.setValue(this.getSize()+" coincidencias para la busqueda");

    }
}
