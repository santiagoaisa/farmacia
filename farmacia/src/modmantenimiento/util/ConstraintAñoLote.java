package modmantenimiento.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;


public class ConstraintAñoLote implements Constraint{

    private int ancho;

    public ConstraintAñoLote(int ancho) {
        this.ancho = ancho;
    }

    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        Integer año = ((Integer) value);

        if(año==null){
            throw new WrongValueException(comp, "Debe de Ingresar un Año");
        }

        String cadena=año.toString();


        if(cadena.length()<ancho ){
            throw new WrongValueException(comp, "El campo debe tener: "+ancho+" caracteres");
        }

        if(cadena.length()>ancho ){
            throw new WrongValueException(comp, "El campo debe tener: "+ancho+" caracteres");
        }
        if(año<2000 || año>2040){
            throw new WrongValueException(comp, "Año incorrecto");
        }


    }

}
