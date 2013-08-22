package modmantenimiento;

import com.zarcillo.domain.MotivoNotaboCliente;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.MotivoNotaboClienteService;
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
public class ManttoMotivoNotaboCliente extends SelectorComposer implements CrudListener{
    
    private MotivoNotaboCliente motivo=new MotivoNotaboCliente();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;       
    
    @Wire
    private Window winMotivonotabo;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bDevolucion;
    
    @Wire
    private Checkbox bDescuento;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    MotivoNotaboClienteService motivoNotaboClienteService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winMotivonotabo")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winMotivonotabo.getFellow("menuMantto");
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
        motivo.setCnommotivo(txtNombre.getText().toUpperCase());
        motivo.setIdusuario(usuario);
        motivo.setBdescuento(bDescuento.isChecked());
        motivo.setBdevolucion(bDevolucion.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (motivo.getIdmotivo()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(motivo.getCnommotivo());     
        bDescuento.setChecked(motivo.getBdescuento());
        bDevolucion.setChecked(motivo.getBdevolucion());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        motivo=new MotivoNotaboCliente();
        txtNombre.setText("");
        bDescuento.setChecked(false);
        bDevolucion.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedamotivonotabocliente.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstMotivo");
            ListModel modelobuscado = lstproducto1.getModel();
            motivo = (MotivoNotaboCliente) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (motivo.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }
    }

    @Override
    public void grabar() {        
        motivoNotaboClienteService.registrar(motivo);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        motivoNotaboClienteService.actualizar(motivo);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (motivo.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            motivoNotaboClienteService.eliminar(motivo);
            motivo=new MotivoNotaboCliente();
            Messagebox.show("El Motivo Fue Eliminado", "Motivo N/C Cliente", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        bDescuento.setDisabled(enable);
        bDevolucion.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winMotivonotabo.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}


