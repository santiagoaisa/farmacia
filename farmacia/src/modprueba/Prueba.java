package modprueba;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Familia;
import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Modulo;
import com.zarcillo.domain.Presentacion;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.negocio.Igv;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.MapaService;
import com.zarcillo.service.ModuloService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import jxl.Cell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.zkoss.util.media.Media;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;

import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zkmax.zul.Nav;
import org.zkoss.zkmax.zul.Navbar;
import org.zkoss.zkmax.zul.Navitem;
import org.zkoss.zul.Button;
import org.zkoss.zul.Div;
import org.zkoss.zul.Fileupload;
import org.zkoss.zul.Label;
import org.zkoss.zul.Menu;
import org.zkoss.zul.Menubar;
import org.zkoss.zul.Menuitem;
import org.zkoss.zul.Menupopup;
import org.zkoss.zul.Menuseparator;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Toolbar;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.West;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Prueba extends SelectorComposer {
    //controles

    @Wire
    private Window winPrueba;
    @Wire
    private Button btnCargar;
    @WireVariable
    private ProductoService productoService;
    @WireVariable
    private ExistenciaService existenciaService;

    @Listen("onCreate=window#index")
    public void onCreate() throws NamingException {
    }

    @Listen("onClick = #btnCargar")
    public void onConsultaFactura(Event event) {



        try {
            Media media = Fileupload.get();
            Workbook workbook = Workbook.getWorkbook(media.getStreamData());

            Sheet sheet = workbook.getSheet(0);
            Producto producto;
            Existencia existencia;
            for (int i = 1; i < sheet.getRows(); i++) {
                Cell celda = sheet.getCell(0, i);

                if (celda.getContents().trim().isEmpty()) {
                    continue;
                }

                producto = new Producto();
                producto.setCnomproducto(celda.getContents().trim().toUpperCase());
                celda = sheet.getCell(3, i);
                Sublinea sublinea = new Sublinea(new Integer(celda.getContents()));
                sublinea.setIdlinea(new Linea(new Integer(celda.getContents())));
                producto.setIdsublinea(sublinea);
                producto.setIdfamilia(new Familia(0));
                producto.setIdpresentacion(new Presentacion(21));
                producto.setIdusuario(new Usuario(2));

                producto = productoService.registrar(producto);

                existencia = new Existencia(1, producto.getIdproducto());
                existencia.setIdalmacen(new Almacen(1));
                existencia.setIdproducto(producto);

                celda = sheet.getCell(2, i);
                if (!celda.getContents().isEmpty()) {
                    if (celda.getContents() != null) {
                        NumberCell nc = (NumberCell) celda;
                        BigDecimal precio = new BigDecimal(nc.getValue());
                        existencia.setNvalven(Igv.valorVentaDetalleVenta(precio, false));
                    }


                }

                existenciaService.registrar(existencia);


                ///combinadas 2

                //2
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
