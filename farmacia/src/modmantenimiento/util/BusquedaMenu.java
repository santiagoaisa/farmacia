package modmantenimiento.util;

import com.zarcillo.domain.Menu;
import com.zarcillo.domain.Modulo;
import com.zarcillo.service.MenuService;
import com.zarcillo.service.ModuloService;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.SelectEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaMenu extends SelectorComposer {
       
    @Wire    
    private Listbox lstMenu;
    
    @Wire
    private Combobox cboModulo;    
    
    @WireVariable
    MenuService menuService;
    
    @WireVariable
    ModuloService moduloService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloMenu;
    private ListModelList modeloModulo;
    
    @Listen("onCreate=window#WinBmenu")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBmenu/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onSelect = #cboModulo")
    public void select(SelectEvent event) {
        Modulo modulo=(Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        List<Menu> listaMenu = new ArrayList<>();
        listaMenu.addAll(menuService.listaPorIdmoduloMenuArchivo(modulo.getIdmodulo()));
        listaMenu.addAll(menuService.listaPorIdmoduloMenuProceso(modulo.getIdmodulo()));
        listaMenu.addAll(menuService.listaPorIdmoduloMenuConsulta(modulo.getIdmodulo()));
        listaMenu.addAll(menuService.listaPorIdmoduloMenuHerramienta(modulo.getIdmodulo()));
        modeloMenu=new ListModelList(listaMenu);
        lstMenu.setModel(modeloMenu); 
        menuresultado.setSize(modeloMenu.getSize());
    }

    
    public void initComponets(){
        modeloMenu=new ListModelList();        
        lstMenu.setModel(modeloMenu);
        modeloModulo=new ListModelList(moduloService.listaGeneral());
        cboModulo.setModel(modeloModulo);
        menuresultado.setSize(modeloMenu.getSize());
    }      
}

