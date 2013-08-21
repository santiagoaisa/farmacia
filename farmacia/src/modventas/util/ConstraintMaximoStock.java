package modventas.util;

import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zul.Constraint;


public class ConstraintMaximoStock implements Constraint{

    private int nStock;

    public ConstraintMaximoStock(int nStock) {
        this.nStock = nStock;
    }

    @Override
    public void validate(Component comp, Object value) throws WrongValueException {
        Integer stock = ((Integer) value);
        if(stock>nStock ){
            throw new WrongValueException(comp, "Excede el limite de Stock");
        }
    }

}