package modalmacen.util;

import com.zarcillo.dto.almacen.Kardex;
import org.zkoss.zk.ui.Component;
import org.zkoss.zkplus.databind.TypeConverter;
import org.zkoss.zul.Listitem;

public class ConvertidorEstadoKardex implements TypeConverter {
    @Override
    public Object coerceToUi(Object val, Component comp) {
        Kardex kardex=(Kardex) val;
        if (kardex.isBanulado()) {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #D0F5A9;color : #000000");
        }
        else if (kardex.isBdevuelto())
        {
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #F8E0E0;color : #000000");
        }
        else if(kardex.isBresumen()){
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #F5F6CE;color : #000000");
        }
        else{
            Listitem fila=(Listitem) comp.getParent();
            fila.setStyle("background-color: #FFFFFF;color : #000000");
        }
        return kardex.toString();
    }

    @Override
    public Object coerceToBean(Object val, Component comp) {
        return null;
    }
}


