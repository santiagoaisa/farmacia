package modmantenimiento.util;

import com.zarcillo.service.DocumentoService;
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
public class BusquedaDocumento extends SelectorComposer {
       
    @Wire
    private Listbox lstDocumento;
    
    
    @WireVariable
    DocumentoService documentoService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloDocumento;
    
    @Listen("onCreate=window#WinBdocumento")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBbanco/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    
    public void initComponets(){
        modeloDocumento=new ListModelList(documentoService.listaGeneral());
        lstDocumento.setModel(modeloDocumento);
        lstDocumento.onInitRender();
        menuresultado.setSize(modeloDocumento.getSize());
    }      
}

