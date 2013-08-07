package modprueba;

import java.io.InputStream;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zul.Button;

/**
 *
 * @author saisa
 */
@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Prueba extends SelectorComposer {

    @Wire
    private Button btnImprimir;
    
    private MenuImpresion menuimpresion;

    @Listen("onCreate=window#winPrueba")
    public void onCreate() throws InterruptedException, JRException, NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winPrueba/mimpresion");
        menuimpresion = (MenuImpresion) macro.getChildren().get(0);
        
        

    }
    
     @Listen("onClick = button#btnImprimir")
    public void onRegistrar(Event event) {
        menuimpresion.dialogoImpresion(true);
        menuimpresion.imprimirReporte(null, 20933648, null,null);
    }
    
    
}
