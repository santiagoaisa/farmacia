package modmantenimiento;

import com.zarcillo.domain.Autorizacion;
import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Rol;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.RolService;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoUsuario extends SelectorComposer implements CrudListener{
    
    private Usuario usuario=new Usuario();   
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloRol;
    private ListModelList modeloPermiso;
    private List<DetalleAutorizacion> listaAutorizacion=new ArrayList<DetalleAutorizacion>();
    
    @Wire
    private Window winUsuario;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtLogin;
    
    @Wire
    private Textbox txtClave;
    
    @Wire
    private Combobox cboRol;
    
    @Wire
    private Checkbox bActivo;
    
    @Wire
    private Button btnPermiso;
    
    @Wire
    private Listbox lstPermiso;
    
          
    @WireVariable
    UsuarioService usuarioService;
        
    @WireVariable
    RolService rolService;
    
        
    
    @Listen("onCreate=window#winUsuario")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winUsuario/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoDireccion(Event event) {
        cboRol.select();
    }   
    
    @Listen("onClick = #btnPermiso")
    public void onAgregarPermiso(Event event) {
        agregarPermiso();
    }  
       
    public void initComponets(){
        modeloRol=new ListModelList(rolService.listaGeneral());
        cboRol.setModel(modeloRol);
        modeloPermiso=new ListModelList();
        lstPermiso.setModel(modeloPermiso);
        habilitar(true);
    }  
    
    public void agregarPermiso() {
        Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/agregarautorizacionusuario.zul", null, null);
        wincrea.setAttribute("REST", true);
        Autorizacion autorizacion;
        DetalleAutorizacion dAutorizacion=new DetalleAutorizacion();
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            Listbox lstbusqueda = (Listbox) wincrea.getFellow("lstAutorizacion");
            ListModel modelobuscado = lstbusqueda.getModel();
            autorizacion=  (Autorizacion) modelobuscado.getElementAt(lstbusqueda.getSelectedIndex());
            dAutorizacion.setIdusuario(usuario);
            dAutorizacion.setIdautorizacion(autorizacion);
            dAutorizacion.getIdautorizacion().getCnomautorizacion();
            listaAutorizacion.add(dAutorizacion);
            modeloPermiso=new ListModelList(listaAutorizacion);
            lstPermiso.setModel(modeloPermiso);
        }
    }
    
    @Override
    public void leer() {     
        Rol rol=(Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        usuario.setIdrol(rol);
        usuario.setCnomusuario(txtNombre.getText().toUpperCase());
        usuario.setClogin(txtLogin.getText());
        usuario.setCclave(txtClave.getText());
        usuario.setBactivo(bActivo.isChecked());
        usuario.setDetalleAutorizacionCollection(listaAutorizacion);
    }
    
    @Override
    public void escribir() {
        if (usuario.getIdusuario() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(usuario.getCnomusuario());
        txtLogin.setText(usuario.getClogin());
        txtClave.setText(usuario.getCclave());
        bActivo.setChecked(usuario.getBactivo());
        cboRol.setSelectedIndex(modeloRol.indexOf(usuario.getIdrol()));
        listaAutorizacion=usuarioService.listaDetalleAutorizacionPorIdusuario(usuario.getIdusuario());
        modeloPermiso=new ListModelList(listaAutorizacion);
        lstPermiso.setModel(modeloPermiso);
        
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        usuario=new Usuario();
        listaAutorizacion.clear();
        modeloPermiso=new ListModelList(listaAutorizacion);
        lstPermiso.setModel(modeloPermiso);
        txtLogin.setText("");
        txtNombre.setText("");
        txtClave.setText("");
        cboRol.setSelectedIndex(-1);
        cboRol.setText("");     
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedausuario.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstbusqueda = (Listbox) winbuscaprod.getFellow("lstUsuario");
            ListModel modelobuscado = lstbusqueda.getModel();
            usuario =   (Usuario) modelobuscado.getElementAt(lstbusqueda.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (usuario.getIdusuario() == null) {
            throw new ExceptionZarcillo("Debe Buscar Usuario...");
        }
    }

    @Override
    public void grabar() {        
        usuarioService.registrar(usuario);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        usuarioService.actualizar(usuario);
        Messagebox.show("Actualizacion Satisfactoria");
    }

    @Override
    public void eliminar() {
        if (usuario.getIdusuario() == null) {
            throw new ExceptionZarcillo("Debe Buscar Usuario ...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            usuarioService.eliminar(usuario);
            usuario = new Usuario();
            Messagebox.show("El Usuario Fue Eliminado", "Usuario", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {        
        txtNombre.setReadonly(enable);
        txtLogin.setReadonly(enable);
        txtClave.setReadonly(enable);
        cboRol.setDisabled(enable);
        bActivo.setDisabled(enable);
        btnPermiso.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboRol.getValue();
        txtNombre.getValue();
        txtLogin.getValue();
        txtClave.getValue();
    }

    @Override
    public void salir() {
        winUsuario.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        txtLogin.setConstraint(new ConstraintCamposObligatorios());
        txtClave.setConstraint(new ConstraintCamposObligatorios());
        cboRol.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        txtLogin.setConstraint("");
        txtClave.setConstraint("");
        cboRol.setConstraint("");
    }   
}