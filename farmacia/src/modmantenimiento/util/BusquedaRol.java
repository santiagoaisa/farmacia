package modmantenimiento.util;

import com.zarcillo.service.RolService;
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
public class BusquedaRol extends SelectorComposer {
       
    @Wire
    private Listbox lstRol;
    
    
    @WireVariable
    RolService rolService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloRol;
    
    @Listen("onCreate=window#WinBrol")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBrol/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloRol=new ListModelList(rolService.listaGeneral());
        lstRol.setModel(modeloRol);
        lstRol.onInitRender();
        menuresultado.setSize(modeloRol.getSize());
    }      
}

