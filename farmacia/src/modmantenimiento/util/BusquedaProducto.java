package modmantenimiento.util;

import com.zarcillo.service.ProductoService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaProducto extends SelectorComposer {
    
    @Wire
    private Listbox lstProducto;
    @Wire
    private Window WinBproducto;
    @Wire
    private Textbox txtCriterio;
    
    @WireVariable
    ProductoService productoService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloProducto;
    
    @Listen("onCreate=window#WinBproducto")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBproducto.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onOK = #txtCriterio")
    public void onFocoNombre(Event event) {
        buscar(txtCriterio.getText().trim());
    }
    
    
    public void initComponets(){
        modeloProducto=new ListModelList();
        lstProducto.setModel(modeloProducto);
        lstProducto.onInitRender();
        menuresultado.setSize(modeloProducto.getSize());
    }      
    public void buscar(String criterio) {
        if (criterio.length() >= 3) {
            modeloProducto=new ListModelList(productoService.busquedaListaPorDescripcion(criterio));
            lstProducto.setModel(modeloProducto);
            lstProducto.onInitRender();
            menuresultado.setSize(modeloProducto.getSize());
            if (lstProducto.getItemCount() > 0) {
                lstProducto.setSelectedIndex(0);
                lstProducto.getSelectedItem().focus();
            } else {
                txtCriterio.focus();
            }
        }
    }
}


