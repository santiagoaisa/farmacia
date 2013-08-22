package modmantenimiento.util;

import com.zarcillo.service.FamiliaService;
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
public class BusquedaFamilia extends SelectorComposer {
    
    @Wire
    private Listbox lstFamilia;
    @Wire
    private Window WinBfamilia;
    @WireVariable
    FamiliaService familiaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloFamilia;
    
    @Listen("onCreate=window#WinBfamilia")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBfamilia.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloFamilia=new ListModelList(familiaService.listaGeneral());
        lstFamilia.setModel(modeloFamilia);
        lstFamilia.onInitRender();
        menuresultado.setSize(modeloFamilia.getSize());
    }      
}

