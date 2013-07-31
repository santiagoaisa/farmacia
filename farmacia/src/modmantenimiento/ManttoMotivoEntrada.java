package modmantenimiento;

import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.MotivoEntradaService;
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
public class ManttoMotivoEntrada extends SelectorComposer implements CrudListener{
    
    private MotivoEntrada mentrada=new MotivoEntrada();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winMotivoEntrada;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bCosteo;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winMotivoEntrada")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winMotivoEntrada/menuMantto");
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
        mentrada.setCnomotivo(txtNombre.getText().toUpperCase());
        mentrada.setIdusuario(usuario);
        mentrada.setBcosteo(bCosteo.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (mentrada.getIdmotivo()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(mentrada.getCnomotivo());     
        bCosteo.setChecked(mentrada.getBcosteo());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        mentrada=new MotivoEntrada();
        txtNombre.setText("");
        bCosteo.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedamotivoentrada.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstMotivo");
            ListModel modelobuscado = lstproducto1.getModel();
            mentrada = (MotivoEntrada) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (mentrada.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }
    }

    @Override
    public void grabar() {        
        motivoEntradaService.registrar(mentrada);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        motivoEntradaService.actualizar(mentrada);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (mentrada.getIdmotivo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Motivo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            motivoEntradaService.eliminar(mentrada);
            mentrada=new MotivoEntrada();
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
        bCosteo.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winMotivoEntrada.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}

