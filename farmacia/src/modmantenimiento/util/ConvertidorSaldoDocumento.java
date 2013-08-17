package modmantenimiento.util;

import java.math.BigDecimal;
import org.zkoss.zk.ui.Component;
import org.zkoss.zkplus.databind.TypeConverter;
import org.zkoss.zul.Listitem;

public class ConvertidorSaldoDocumento implements TypeConverter {
    @Override
    public Object coerceToUi(Object val, Component comp) {
        BigDecimal saldo=(BigDecimal) val;
        Integer cero = saldo.compareTo(new BigDecimal("0"));
        if (cero.equals(1)) {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #F6D8D5;color : #000000");
        }
        else
        {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #FFFFFF;color : #000000");
        }
        return saldo.toString();
    }

    @Override
    public Object coerceToBean(Object val, Component comp) {
        return null;
    }
}