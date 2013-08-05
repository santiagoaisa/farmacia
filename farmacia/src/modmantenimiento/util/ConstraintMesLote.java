package modmantenimiento.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;

public class ConstraintMesLote implements Constraint {

    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        Integer mes = ((Integer) value);
        if(mes==null){
            throw new WrongValueException(comp, "Debe de Ingresar un Mes de Vencimiento");
        }
        //si es menor a 1 o mayor
        if(mes<1 || mes>12){
            throw new WrongValueException(comp, "Ingresar un mes valido entre (01-12)");
        }
    }
}