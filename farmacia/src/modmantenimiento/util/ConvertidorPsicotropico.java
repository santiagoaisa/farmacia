package modmantenimiento.util;

import com.zarcillo.domain.Producto;
import org.zkoss.zk.ui.Component;
import org.zkoss.zkplus.databind.TypeConverter;
import org.zkoss.zul.Listitem;
    

public class ConvertidorPsicotropico implements TypeConverter {
    @Override
    public Object coerceToUi(Object val, Component comp) {
        Producto producto=(Producto) val;
        if (producto.getBpsicotropico()) {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #F6D8D5;color : #000000");
        }
        else
        {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #FFFFFF;color : #000000");
        }
        return producto.toString();
    }

    @Override
    public Object coerceToBean(Object val, Component comp) {
        return null;
    }
}
