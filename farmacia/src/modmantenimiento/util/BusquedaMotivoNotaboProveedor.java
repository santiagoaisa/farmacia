package modmantenimiento.util;

import com.zarcillo.service.MotivoNotaboProveedorService;
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
public class BusquedaMotivoNotaboProveedor extends SelectorComposer {
       
    @Wire
    private Listbox lstMotivo;
    @Wire
    private Window WinBmotivo;
    
    @WireVariable
    MotivoNotaboProveedorService motivoNotaboProveedorService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloMotivo;
    
    @Listen("onCreate=window#WinBmotivo")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBmotivo.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloMotivo=new ListModelList(motivoNotaboProveedorService.listaGeneral());
        lstMotivo.setModel(modeloMotivo);
        lstMotivo.onInitRender();
        menuresultado.setSize(modeloMotivo.getSize());
    }      
}


