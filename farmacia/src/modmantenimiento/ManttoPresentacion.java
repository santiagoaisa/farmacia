package modmantenimiento;

import com.zarcillo.domain.Presentacion;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.PresentacionService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoPresentacion extends SelectorComposer implements CrudListener{
    
    private Presentacion presentacion=new Presentacion();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winPresentacion;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtAbrev;
          
    @Wire
    private Checkbox bActivo;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    PresentacionService presentacionService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winPresentacion")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winPresentacion/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        presentacion.setCnompresentacion(txtNombre.getText().toUpperCase());
        presentacion.setCabrev(txtAbrev.getText());
        presentacion.setIdusuario(usuario);
        presentacion.setBactivo(bActivo.isChecked());
    }    
    
    @Override
    public void escribir() {
        if (presentacion.getIdpresentacion()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(presentacion.getCnompresentacion());    
        txtAbrev.setText(presentacion.getCabrev());
        bActivo.setChecked(presentacion.getBactivo());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        presentacion=new Presentacion();
        txtNombre.setText("");
        txtAbrev.setText("");
        bActivo.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedapresentacion.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstPresentacion");
            ListModel modelobuscado = lstproducto1.getModel();
            presentacion = (Presentacion) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (presentacion.getIdpresentacion() == null) {
            throw new ExceptionZarcillo("Debe Buscar Presentacion...");
        }
    }

    @Override
    public void grabar() {        
        presentacionService.registrar(presentacion);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        presentacionService.actualizar(presentacion);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (presentacion.getIdpresentacion()== null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            presentacionService.eliminar(presentacion);
            presentacion=new Presentacion();
            Messagebox.show("La presentacion Fue Eliminada", "Presentacion", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        txtAbrev.setReadonly(enable);
        bActivo.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winPresentacion.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}

