package modmantenimiento.util;

import com.zarcillo.service.VendedorService;
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
public class BusquedaVendedor extends SelectorComposer {
       
    @Wire
    private Listbox lstVendedor;
    
    
    @WireVariable
    VendedorService vendedorService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloVendedor;
    
    @Listen("onCreate=window#WinBvendedor")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBvendedor/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloVendedor=new ListModelList(vendedorService.listaGeneral());
        lstVendedor.setModel(modeloVendedor);
        lstVendedor.onInitRender();
        menuresultado.setSize(modeloVendedor.getSize());
    }      
}

