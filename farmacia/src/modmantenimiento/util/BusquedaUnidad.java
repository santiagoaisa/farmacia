package modmantenimiento.util;

import com.zarcillo.service.UnidadNegocioService;
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
public class BusquedaUnidad extends SelectorComposer {
       
    @Wire
    private Listbox lstUnidad;   
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloUnidad;
    
    @Listen("onCreate=window#WinBunidad")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBunidad/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloUnidad=new ListModelList(unidadNegocioService.listaGeneral());
        lstUnidad.setModel(modeloUnidad);
        lstUnidad.onInitRender();
        menuresultado.setSize(modeloUnidad.getSize());
    }      
}

