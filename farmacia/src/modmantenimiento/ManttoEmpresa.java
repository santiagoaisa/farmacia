package modmantenimiento;

import com.zarcillo.domain.Empresa;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.EmpresaService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Image;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;


public class ManttoEmpresa extends SelectorComposer implements CrudListener{
    
    private Empresa empresa=new Empresa();
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winEmpresa;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Textbox txtRuc;
    
    @Wire
    private Datebox dFecha;
    
    @Wire
    private Combobox cboDepartamento;
    
    @Wire
    private Combobox cboProvincia;
    
    @Wire
    private Combobox cboDistrito;
    
    @Wire
    private Textbox txtTelefono;
    
    @Wire
    private Textbox txtFax;
    
    @Wire
    private Textbox txtMovil;
    
    @Wire
    private Image logo;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    EmpresaService empresaService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winAlmacen")
    public void onCreate() throws NamingException {
         HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winAlmacen/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        txtRuc.select();
    }
    
    @Listen("onOK = #txtRuc")
    public void onFocoFecha(Event event) {
        dFecha.focus();
    }
     
    @Listen("onOK = #txtNombre")
    public void onFocoDireccion(Event event) {
        txtDireccion.select();
    }
    
    @Listen("onOK = #txtDireccion")
    public void onFocoDepartamento(Event event) {
        cboDepartamento.focus();
    }
    
    @Listen("onOK = #cboDepartamento")
    public void onFocoProvincia(Event event) {
        cboProvincia.focus();
    }
    
    @Listen("onOK = #cboProvincia")
    public void onFocoDistrito(Event event) {
        cboDistrito.focus();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloDepartamento=new ListModelList();
        cboDepartamento.setModel(modeloDepartamento);
        modeloProvincia=new ListModelList();
        cboProvincia.setModel(modeloProvincia);
        modeloDistrito=new ListModelList();
        cboDistrito.setModel(modeloDistrito);
    }

    @Override
    public void leer() {      
    }

    @Override
    public void escribir() {
        if (empresa.getIdempresa() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(empresa.getCnomempresa());
        txtDireccion.setText(empresa.getCdireccion());
    }

    @Override
    public void limpiar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaempresa.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstempresa");
            ListModel modelobuscado = lstproducto1.getModel();
            empresa =  (Empresa) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void grabar() {
        empresa.setIdusuario(usuario);
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void eliminar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void validarDatos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void salir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }   

    private void quitarConstraint() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
}

