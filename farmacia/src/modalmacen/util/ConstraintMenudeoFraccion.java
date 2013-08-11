package modalmacen.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;


public class ConstraintMenudeoFraccion implements Constraint{

    private int fraccion;
    private int menudeo;

    public ConstraintMenudeoFraccion (int fraccion,int menudeo) {
        this.fraccion = fraccion;
        this.menudeo=menudeo;
    }

    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        if(menudeo>=fraccion){
            throw new WrongValueException(comp, "Valor no puede ser mayor a la Fraccion");
        }
    }

}
