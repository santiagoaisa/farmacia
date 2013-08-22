package modmantenimiento.util;

import com.zarcillo.service.BancoService;
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
public class BusquedaBanco extends SelectorComposer {
       
    @Wire
    private Listbox lstBanco;
    @Wire
    private Window WinBbanco;
    
    @WireVariable
    BancoService bancoService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloBanco;
    
    @Listen("onCreate=window#WinBbanco")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBbanco.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloBanco=new ListModelList(bancoService.listaGeneral());
        lstBanco.setModel(modeloBanco);
        lstBanco.onInitRender();
        menuresultado.setSize(modeloBanco.getSize());
    }      
}
