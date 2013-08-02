package modmantenimiento.util;

import com.zarcillo.service.TipoCuentaBancariaService;
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
public class BusquedaTipoCuentaBancaria extends SelectorComposer {
       
    @Wire
    private Listbox lstTipo;
    
    
    @WireVariable
    TipoCuentaBancariaService tipoCuentaBancariaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloTipo;
    
    @Listen("onCreate=window#WinBtipo")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBtipo/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloTipo=new ListModelList(tipoCuentaBancariaService.listaGeneral());
        lstTipo.setModel(modeloTipo);
        lstTipo.onInitRender();
        menuresultado.setSize(modeloTipo.getSize());
    }      
}



