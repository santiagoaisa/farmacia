package modmantenimiento;

import com.zarcillo.domain.Familia;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.FamiliaService;
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
public class ManttoFamilia extends SelectorComposer implements CrudListener{
    
    private Familia familia=new Familia();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winFamilia;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bActivo;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    FamiliaService familiaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winFamilia")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winFamilia/menuMantto");
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
        familia.setCnomfamilia(txtNombre.getText().toUpperCase());
        familia.setIdusuario(usuario);
        familia.setBactivo(bActivo.isChecked());
    }    
    
    @Override
    public void escribir() {
        if (familia.getIdfamilia()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(familia.getCnomfamilia());     
        bActivo.setChecked(familia.getBactivo());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        familia=new Familia();
        txtNombre.setText("");
        bActivo.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedafamilia.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstFamilia");
            ListModel modelobuscado = lstproducto1.getModel();
            familia = (Familia) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (familia.getIdfamilia() == null) {
            throw new ExceptionZarcillo("Debe Buscar Familia...");
        }
    }

    @Override
    public void grabar() {        
        familiaService.registrar(familia);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        familiaService.actualizar(familia);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (familia.getIdfamilia()== null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            familiaService.eliminar(familia);
            familia=new Familia();
            Messagebox.show("La familia Fue Eliminada", "Familia", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        bActivo.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winFamilia.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}


