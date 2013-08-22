package modmantenimiento;

import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.MotivoSalidaService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
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
public class ManttoMotivoSalida extends SelectorComposer implements CrudListener{
    
    private MotivoSalida msalida=new MotivoSalida();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winMotivoSalida;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bVenta;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    MotivoSalidaService motivoSalidaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winMotivoSalida")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winMotivoSalida.getFellow("menuMantto");
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
        msalida.setCnommotivo(txtNombre.getText().toUpperCase());
        msalida.setIdusuario(usuario);
        msalida.setBventa(bVenta.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (msalida.getIdmotivo()== null) {
            limpiar();
            return;
        }
        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(msalida.getCnommotivo());     
        bVenta.setChecked(msalida.getBventa());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        msalida=new MotivoSalida();
        txtNombre.setText("");
        bVenta.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedamotivosalida.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstMotivo");
            ListModel modelobuscado = lstproducto1.getModel();
            msalida = (MotivoSalida) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (msalida.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }
    }

    @Override
    public void grabar() {        
        motivoSalidaService.registrar(msalida);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        motivoSalidaService.actualizar(msalida);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (msalida.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            motivoSalidaService.eliminar(msalida);
            msalida=new MotivoSalida();
            Messagebox.show("El Motivo Fue Eliminado", "Motivo", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        bVenta.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winMotivoSalida.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}


