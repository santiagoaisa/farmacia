package modmantenimiento.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;
import org.zkoss.zul.Intbox;

public class ConstraintCantidadValida implements Constraint {
    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        Integer cantidad = ((Integer) value);
        Intbox canart = (Intbox) comp;
        if (cantidad <= 0) {
            canart.setConstraint("");
            throw new WrongValueException(comp, "Ingresar un cantidad valida");
        }
    }
}