package modmantenimiento;

import com.zarcillo.domain.Rol;
import com.zarcillo.service.RolService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoRol extends SelectorComposer implements CrudListener{
    
    private Rol rol=new Rol();
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winRol;
    
    @Wire
    private Textbox txtNombre;
    
    
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    RolService rolService;
    
          
    
    
    @Listen("onCreate=window#winRol")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winRol/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    
    
    public void initComponets(){
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        rol.setCnomrol(txtNombre.getText().toUpperCase());
    }
    
    
    @Override
    public void escribir() {
        if (rol.getIdrol()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setValue(rol.getCnomrol());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        rol=new Rol();
        txtNombre.setText("");
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedarol.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstRol");
            ListModel modelobuscado = lstproducto1.getModel();
            rol =  (Rol) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (rol.getIdrol() == null) {
            throw new ExceptionZarcillo("Debe Buscar Rol...");
        }
    }

    @Override
    public void grabar() {        
        rolService.registrar(rol);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        rolService.actualizar(rol);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (rol.getIdrol() == null) {
            throw new ExceptionZarcillo("Debe Buscar Rol...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            rolService.eliminar(rol);
            rol = new Rol();
            Messagebox.show("La Rol Fue Eliminada", "Rol", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);        
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winRol.onClose();
    }   

    public void agregarConstraint() {       
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}

