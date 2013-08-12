package modprueba;

import com.zarcillo.domain.Familia;
import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Presentacion;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.VentaService;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.List;
import javax.naming.NamingException;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


import net.sf.jasperreports.engine.JRException;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.ForwardEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Fileupload;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
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
    @Wire
    private Textbox txtDescripcion;
    @Wire
    private Listbox lstDetalle;
    @WireVariable
    private ProductoService productoService;
    @WireVariable
    private VentaService ventaService;
    private MenuImpresion menuimpresion;

    @Listen("onCreate=window#winPrueba")
    public void onCreate() throws InterruptedException, JRException, NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winPrueba.getFellow("mimpresion");
        menuimpresion = (MenuImpresion) macro.getChildren().get(0);

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

    @Listen("onOK = #txtDescripcion")
    public void buscar(Event event) { //signature if you care about event
       buscar();

    }
    
    @Listen("onCtrlKey = #txtDescripcion")
    public void buscarTecla(Event event) { //signature if you care about event
       buscar();
    }
    
    private void buscar(){
         List<DetalleVenta> listaDetalleVenta = ventaService.busquedaListaPorIdalmacenPorDescripcion(1, txtDescripcion.getText().trim());
        ListModelList modelo = new ListModelList(listaDetalleVenta);
        lstDetalle.setModel(modelo);
        lstDetalle.onInitRender();
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
            linea = new Linea(new Integer(celda.getContents().trim()));
            sublinea = new Sublinea(linea.getIdlinea());
            sublinea.setIdlinea(linea);;

            producto.setIdsublinea(sublinea);
            //presentaqcion
            celda = sheet.getCell(3, i);
            producto.setIdpresentacion(new Presentacion(new Integer(celda.getContents().trim())));
            celda = sheet.getCell(2, i);
            producto.setCnomproducto(celda.getContents().trim());
            //iafecto
            celda = sheet.getCell(4, i);
            if (celda.getContents().trim().contains("true")) {
                producto.setBinafecto(true);
            }

            celda = sheet.getCell(5, i);
            if (celda.getContents().trim().contains("true")) {
                producto.setBinafecto(true);
            }


            //id

            celda = sheet.getCell(6, i);
            Integer id = new Integer(celda.getContents().trim());
            String cid = formato.format(linea.getIdlinea()) + formato.format(id);
            producto.setIdproducto(cid);


            celda = sheet.getCell(7, i);
            if (celda.getContents() != null) {
                producto.setCreseta(celda.getContents().trim().toUpperCase());
            }

            celda = sheet.getCell(8, i);
            producto.setIdfamilia(new Familia(new Integer(celda.getContents().trim())));

            productoService.registrar(producto);

        }



    }
}
