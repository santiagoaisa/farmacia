package modcompras.proceso;


import com.zarcillo.dto.compra.ActualizarExistencia;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.ListadoExistenciaService;
import com.zarcillo.service.ListadoProductoService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.MenuResultado;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ActualizacionPrecioExistencia extends SelectorComposer {
    
    private Usuario usuario;
    private MenuResultado menuresultado;
    private ListModelList modeloExistencia;
    private ListModelList modeloAlmacen;
    
    
    @Wire
    private Window winExistencia;
    
    @Wire
    private Listbox lstExistencia;
    
    @Wire
    private Textbox txtCriterio;
    
    @Wire
    private Combobox cboAlmacen;
    
    @WireVariable
    ExistenciaService existenciaService;
    
    @WireVariable
    ListadoExistenciaService listadoExistenciaService;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    UsuarioService usuarioService;
    
    final Execution exec = Executions.getCurrent();
    private String user_login;
    
    
    
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
    
    @Listen("onClick = #btnActualizar")
    public void onactualizarExistencia(Event event) {
        Toolbarbutton btn = (Toolbarbutton) event.getTarget();
        Listitem item = (Listitem) (btn.getParent().getParent());
        ActualizarExistencia existencia= (ActualizarExistencia) modeloExistencia.getElementAt(item.getIndex());
        listadoExistenciaService.actualizarPrecio(existencia);
        buscar(txtCriterio.getText());
    }
    
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaGeneral());
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        modeloExistencia=new ListModelList();
        lstExistencia.setModel(modeloExistencia);
        lstExistencia.onInitRender();
        menuresultado.setSize(modeloExistencia.getSize());
    }      
    public void buscar(String criterio) {
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        if (criterio.length() >= 3) {
            modeloExistencia=new ListModelList(listadoExistenciaService.listaActualizarPrecioPorDescripcion(almacen.getIdalmacen(),criterio));
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


