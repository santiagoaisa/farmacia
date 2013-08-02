package modmantenimiento;

import com.zarcillo.domain.TipoCuentaBancaria;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.TipoCuentaBancariaService;
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
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoTipoCuentaBancaria extends SelectorComposer implements CrudListener{
    
    private TipoCuentaBancaria tcuenta=new TipoCuentaBancaria();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;       
    
    @Wire
    private Window WinTipocuenta;
    
    @Wire
    private Textbox txtNombre;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    TipoCuentaBancariaService tipoCuentaBancariaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#WinTipocuenta")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinTipocuenta/menuMantto");
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
        tcuenta.setCnomtipo(txtNombre.getText().toUpperCase());
        tcuenta.setIdusuario(usuario);
    }
    
    
    @Override
    public void escribir() {
        if (tcuenta.getIdtipo()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(tcuenta.getCnomtipo());     
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        tcuenta=new TipoCuentaBancaria();
        txtNombre.setText("");
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedatipocuentabancaria.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstTipo");
            ListModel modelobuscado = lstproducto1.getModel();
            tcuenta =  (TipoCuentaBancaria) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (tcuenta.getIdtipo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }
    }

    @Override
    public void grabar() {        
        tipoCuentaBancariaService.registrar(tcuenta);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        tipoCuentaBancariaService.actualizar(tcuenta);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (tcuenta.getIdtipo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Tipo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            tipoCuentaBancariaService.eliminar(tcuenta);
            tcuenta=new TipoCuentaBancaria();
            Messagebox.show("El Tipo Cuenta Fue Eliminado", "Tipo Cuenta Bancaria", Messagebox.OK, Messagebox.INFORMATION);
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
        WinTipocuenta.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}



