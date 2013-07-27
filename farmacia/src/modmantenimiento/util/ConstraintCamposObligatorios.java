package modmantenimiento.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;

public class ConstraintCamposObligatorios implements Constraint {    
    public ConstraintCamposObligatorios() {        
    }
    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        String cadena = ((String) value);       
        if(cadena.isEmpty() ){
            throw new WrongValueException(comp, "El campo no puede estar vacio");
        }        
    }
}