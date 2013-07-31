package modmantenimiento.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.zkoss.zul.Listcell;

public class ListcellFecha extends Listcell {
    private String format;
    private Date date;
    private DateFormat df;

    public void onCreate(){
        df=new SimpleDateFormat(this.getFormat() );
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date fecha) {
        if(fecha==null){
            super.setLabel("");
        }else{
            super.setLabel(df.format(fecha));
        }
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}