package modmantenimiento.util;

import com.zarcillo.service.EmpresaService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Window;


@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaEmpresa extends SelectorComposer {
    
    @Wire
    private Window WinBempresa;
    
    @Wire
    private Listbox lstEmpresa;
    
    
    @WireVariable
    EmpresaService empresaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloEmpresa;
    
    @Listen("onCreate=window#WinBempresa")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBempresa/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloEmpresa=new ListModelList(empresaService.listaGeneral());
        lstEmpresa.setModel(modeloEmpresa);
        lstEmpresa.onInitRender();
        menuresultado.setSize(modeloEmpresa.getSize());
    }  
    
    public void registrar(){
        WinBempresa.setAttribute("REST",true);
        WinBempresa.onClose();                
    }
}
