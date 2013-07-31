package modmantenimiento.util;

import com.zarcillo.service.MotivoEntradaService;
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
public class BusquedaMotivoEntrada extends SelectorComposer {
       
    @Wire
    private Listbox lstMotivo;    
    
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloMotivo;
    
    @Listen("onCreate=window#WinBmotivoentrada")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBmotivoentrada/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloMotivo=new ListModelList(motivoEntradaService.listaGeneral());
        lstMotivo.setModel(modeloMotivo);
        lstMotivo.onInitRender();
        menuresultado.setSize(modeloMotivo.getSize());
    }      
}


