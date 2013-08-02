package modmantenimiento.util;

import com.zarcillo.domain.Rol;
import com.zarcillo.service.RolService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
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


@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaUsuario extends SelectorComposer {
       
    @Wire
    private Listbox lstUsuario;   
    
    @Wire
    private Combobox cboRol;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    RolService rolService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloUsuario;
    private ListModelList modeloRol;
    
    @Listen("onCreate=window#WinBusuario")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBusuario/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onSelect = #cboRol")
    public void onSeleccionRol(Event event) {
        Rol rol=(Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        modeloUsuario=new ListModelList(usuarioService.listaPorIdrol(rol.getIdrol()));
        lstUsuario.setModel(modeloUsuario);
        menuresultado.setSize(modeloUsuario.getSize());
    }
    
    
    public void initComponets(){
        modeloRol=new ListModelList(rolService.listaGeneral());
        cboRol.setModel(modeloRol);
        modeloUsuario=new ListModelList();
        lstUsuario.setModel(modeloUsuario);
        menuresultado.setSize(modeloUsuario.getSize());
    }      
}

