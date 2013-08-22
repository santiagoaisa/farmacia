package modmantenimiento.util;

import com.zarcillo.service.AutorizacionService;
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
public class AgregarAutorizacionUsuario extends SelectorComposer {
    
    @Wire
    private Window WinBautorizacion;
    @Wire
    private Listbox lstAutorizacion;    
    
    @WireVariable
    AutorizacionService autorizacionService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloAutorizacion;
    
    @Listen("onCreate=window#WinBautorizacion")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBautorizacion.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloAutorizacion=new ListModelList(autorizacionService.listaGeneral());
        lstAutorizacion.setModel(modeloAutorizacion);
        lstAutorizacion.onInitRender();
        menuresultado.setSize(modeloAutorizacion.getSize());
    } 
}
