package modmantenimiento;

import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
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
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoMoneda extends SelectorComposer implements CrudListener{
    
    private Moneda moneda=new Moneda();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winMoneda;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bNacional;
    
    @Wire
    private Textbox txtAbrev;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    MonedaService monedaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winMoneda")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winMoneda/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        txtAbrev.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        moneda.setCnommoneda(txtNombre.getText().toUpperCase());
        moneda.setCabrev(txtAbrev.getText());
        moneda.setIdusuario(usuario);
        moneda.setBnacional(bNacional.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (moneda.getIdmoneda()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(moneda.getCnommoneda());
        txtAbrev.setText(moneda.getCabrev());        
        bNacional.setChecked(moneda.getBnacional());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        moneda=new Moneda();
        txtNombre.setText("");
        txtAbrev.setText("");
        bNacional.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedamoneda.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstMoneda");
            ListModel modelobuscado = lstproducto1.getModel();
            moneda =  (Moneda) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (moneda.getIdmoneda() == null) {
            throw new ExceptionZarcillo("Debe Buscar Moneda...");
        }
    }

    @Override
    public void grabar() {        
        monedaService.registrar(moneda);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        monedaService.actualizar(moneda);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (moneda.getIdmoneda() == null) {
            throw new ExceptionZarcillo("Debe Buscar Moneda...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            monedaService.eliminar(moneda);
            moneda = new Moneda();
            Messagebox.show("La Moneda Fue Eliminada", "Moneda", Messagebox.OK, Messagebox.INFORMATION);
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
        bNacional.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winMoneda.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}
