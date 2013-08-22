package modmantenimiento.util;

import com.zarcillo.service.CondicionVentaService;
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
public class BusquedaCondicion extends SelectorComposer {
       
    @Wire
    private Listbox lstCondicion;   
    @Wire
    private Window WinBcondicion;
    
    @WireVariable
    CondicionVentaService condicionVentaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloCondicion;
    
    @Listen("onCreate=window#WinBcondicion")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBcondicion.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloCondicion=new ListModelList(condicionVentaService.listaGeneral());
        lstCondicion.setModel(modeloCondicion);
        lstCondicion.onInitRender();
        menuresultado.setSize(modeloCondicion.getSize());
    }      
}

