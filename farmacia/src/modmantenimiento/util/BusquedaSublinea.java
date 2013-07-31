package modmantenimiento.util;

import com.zarcillo.service.SublineaService;
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
public class BusquedaSublinea extends SelectorComposer {
       
    @Wire
    private Listbox lstSublinea;
    
    
    @WireVariable
    SublineaService sublineaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloSublinea;
    
    @Listen("onCreate=window#WinBsublinea")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBsublinea/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloSublinea=new ListModelList(sublineaService.listaGeneral());
        lstSublinea.setModel(modeloSublinea);
        lstSublinea.onInitRender();
        menuresultado.setSize(modeloSublinea.getSize());
    }      
}