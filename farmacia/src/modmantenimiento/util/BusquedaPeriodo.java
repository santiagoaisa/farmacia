package modmantenimiento.util;

import com.zarcillo.service.PeriodoService;
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
public class BusquedaPeriodo extends SelectorComposer {
       
    @Wire
    private Listbox lstPeriodo;
    @Wire
    private Window WinBperiodo;
    
    @WireVariable
    PeriodoService periodoService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloPeriodo;
    
    @Listen("onCreate=window#WinBperiodo")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBperiodo.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloPeriodo=new ListModelList(periodoService.listaGeneral());
        lstPeriodo.setModel(modeloPeriodo);
        lstPeriodo.onInitRender();
        menuresultado.setSize(modeloPeriodo.getSize());
    }      
}
