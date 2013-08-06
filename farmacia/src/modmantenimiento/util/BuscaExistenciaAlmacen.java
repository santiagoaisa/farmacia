package modmantenimiento.util;

import com.zarcillo.domain.Almacen;
import com.zarcillo.service.ExistenciaService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
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
public class BuscaExistenciaAlmacen extends SelectorComposer {
    
    @Wire
    private Window winExistencia;
    
    @Wire
    private Listbox lstExistencia;
    
    @Wire
    private Textbox txtCriterio;
    
    @WireVariable
    ExistenciaService existenciaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloExistencia;
    private Almacen almacen;
    
    @Listen("onCreate=window#winExistencia")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winExistencia/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onOK = #txtCriterio")
    public void onFocoNombre(Event event) {
        buscar(txtCriterio.getText().trim());
    }
    
    
    public void initComponets(){
        almacen=(Almacen) winExistencia.getAttribute("ALMACEN");
        modeloExistencia=new ListModelList();
        lstExistencia.setModel(modeloExistencia);
        lstExistencia.onInitRender();
        menuresultado.setSize(modeloExistencia.getSize());
    }      
    public void buscar(String criterio) {
        if (criterio.length() >= 3) {
            modeloExistencia=new ListModelList(existenciaService.busquedaListaPorIdalmacenPorDescripcion(almacen.getIdalmacen(),criterio));
            lstExistencia.setModel(modeloExistencia);
            lstExistencia.onInitRender();
            menuresultado.setSize(modeloExistencia.getSize());
            if (lstExistencia.getItemCount() > 0) {
                lstExistencia.setSelectedIndex(0);
                lstExistencia.getSelectedItem().focus();
            } else {
                txtCriterio.focus();
            }
        }
    }
}


