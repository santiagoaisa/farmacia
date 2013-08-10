package modalmacen.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;


public class ConstraintMenudeoIngreso implements Constraint{

    private int entero;
    private int menudeo;

    public ConstraintMenudeoIngreso (int entero,int menudeo) {
        this.entero = entero;
        this.menudeo=menudeo;
    }

    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        if(entero==0&&menudeo==0){
            throw new WrongValueException(comp, "Debe de Ingresar Cantidades validas");
        }
        if(entero!=0&&menudeo!=0){
           throw new WrongValueException(comp, "No puede ingresar cantida y menudeo en una sola linea");

        }
    }

}
