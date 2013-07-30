package modmantenimiento.util;

import com.zarcillo.service.MonedaService;
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

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaMoneda extends SelectorComposer {
       
    @Wire
    private Listbox lstMoneda;
    
    
    @WireVariable
    MonedaService monedaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloMoneda;
    
    @Listen("onCreate=window#WinBmoneda")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBmoneda/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloMoneda=new ListModelList(monedaService.listaGeneral());
        lstMoneda.setModel(modeloMoneda);
        lstMoneda.onInitRender();
        menuresultado.setSize(modeloMoneda.getSize());
    }      
}
