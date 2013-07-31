package modmantenimiento.util;

import com.zarcillo.service.PresentacionService;
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
public class BusquedaPresentacion extends SelectorComposer {
    
    @Wire
    private Listbox lstPresentacion;
    
    @WireVariable
    PresentacionService presentacionService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloPresentacion;
    
    @Listen("onCreate=window#WinBpresentacion")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBpresentacion/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloPresentacion=new ListModelList(presentacionService.listaGeneral());
        lstPresentacion.setModel(modeloPresentacion);
        lstPresentacion.onInitRender();
        menuresultado.setSize(modeloPresentacion.getSize());
    }      
}

