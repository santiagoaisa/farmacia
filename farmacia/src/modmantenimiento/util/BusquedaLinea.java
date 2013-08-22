package modmantenimiento.util;

import com.zarcillo.service.LineaService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaLinea extends SelectorComposer {
       
    @Wire
    private Listbox lstLinea;
    @Wire
    private Window WinBlinea;
    
    @WireVariable
    LineaService lineaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloLinea;
    
    @Listen("onCreate=window#WinBlinea")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBlinea.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloLinea=new ListModelList(lineaService.listaGeneral());
        lstLinea.setModel(modeloLinea);
        lstLinea.onInitRender();
        menuresultado.setSize(modeloLinea.getSize());
    }      
}
