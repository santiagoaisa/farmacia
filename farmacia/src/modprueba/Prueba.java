package modprueba;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Presentacion;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.service.ProductoService;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import javax.naming.NamingException;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


import net.sf.jasperreports.engine.JRException;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.ForwardEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Fileupload;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

/**
 *
 * @author saisa
 */
@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Prueba extends SelectorComposer {

    @Wire
    private Window winPrueba;
    @Wire
    private Button btnImprimir;
    private MenuImpresion menuimpresion;
    @WireVariable
    ProductoService productoService;

    @Listen("onCreate=window#winPrueba")
    public void onCreate() throws InterruptedException, JRException, NamingException {
//        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winPrueba/mimpresion");
//        menuimpresion = (MenuImpresion) macro.getChildren().get(0);
// esto es prueba
    }

    @Listen("onClick = button#btnImprimir")
    public void onRegistrar(Event event) {
        menuimpresion.dialogoImpresion(true);
        menuimpresion.imprimirReporte(null, 20933648, null, null);
    }

    @Listen("onValidar = #winPrueba")
    public void doSave(ForwardEvent event) { //signature if you care about event
        Messagebox.show("Prueba");
    }

    @Listen("onClick = button#btnCargar")
    public void crearproductos() throws Exception {


        Media media = Fileupload.get();
        Workbook workbook = Workbook.getWorkbook(media.getStreamData());
        Sheet sheet = workbook.getSheet(0);
        Producto producto;
        Linea linea;
        Sublinea sublinea;
        DecimalFormat formato = new DecimalFormat("000");
        for (int i = 1; i < sheet.getRows(); i++) {
            Cell celda = sheet.getCell(0, i);
            if (celda.getContents().trim().isEmpty()) {
                continue;
            }


            producto = new Producto();

            //sublinea 
            celda = sheet.getCell(0, i);
            linea=new Linea(new Integer(celda.getContents().trim()));
            sublinea=new Sublinea(linea.getIdlinea());
            sublinea.setIdlinea(linea);;
                    
            producto.setIdsublinea(sublinea);            
            //presentaqcion
            celda = sheet.getCell(3, i);
            producto.setIdpresentacion(new Presentacion(new Integer(celda.getContents().trim())));
            celda = sheet.getCell(2, i);
            producto.setCnomproducto(celda.getContents().trim());
            //iafecto
            celda = sheet.getCell(4, i);
            if(celda.getContents().trim().contains("true")){
                producto.setBinafecto(true);
            }
            
             //id
             
            celda = sheet.getCell(5, i);
            Integer id=new Integer(celda.getContents().trim());
            String cid =formato.format(linea.getIdlinea())+formato.format(id);
           producto.setIdproducto(cid);
            productoService.registrar(producto);


        }



    }
}
