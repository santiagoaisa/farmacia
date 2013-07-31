package modmantenimiento.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import org.zkoss.zul.Listcell;

public class ListcellNumero extends Listcell {
    private String format;
    private BigDecimal decimal;
    private DecimalFormat df;

    public void onCreate(){
        NumberFormat nf = NumberFormat.getNumberInstance(Locale.ROOT);
        df = (DecimalFormat)nf;
        df.applyPattern(this.getFormat());
    }
    public BigDecimal getDecimal() {
        return decimal;
    }
    public void setDecimal(BigDecimal decimal1) {
        if(decimal1==null){
            super.setLabel("");
        }else{
            super.setLabel(df.format(decimal1));
        }
    }
    public String getFormat() {
        return format;
    }
    public void setFormat(String format) {
        this.format = format;
    }
}