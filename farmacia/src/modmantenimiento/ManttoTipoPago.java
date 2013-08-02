package modmantenimiento;

import com.zarcillo.domain.Documento;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.TipoPagoService;
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
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoTipoPago extends SelectorComposer implements CrudListener{
    
    private TipoPago tpago=new TipoPago();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    @Wire
    private Window winTipopago;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtSunat;
              
    @Wire
    private Checkbox bCobro;
        
    @Wire
    private Checkbox bPago;
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    TipoPagoService tipoPagoService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winTipopago")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winTipopago/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoSunat(Event event) {
        txtSunat.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        tpago.setCnomtipo(txtNombre.getText().toUpperCase());
        tpago.setCcodigosunat(txtSunat.getText());
        tpago.setBcobro(bCobro.isChecked());
        tpago.setBpago(bPago.isChecked());
        tpago.setIdusuario(usuario);
    }
    
    
    @Override
    public void escribir() {
        if (tpago.getIdtipo()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(tpago.getCnomtipo());
        txtSunat.setText(tpago.getCcodigosunat());;
        bCobro.setChecked(tpago.getBcobro());
        bPago.setChecked(tpago.getBpago());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        tpago=new TipoPago();
        txtNombre.setText("");
        txtSunat.setText("");
        bCobro.setChecked(false);
        bPago.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedatipopago.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstTipopago");
            ListModel modelobuscado = lstproducto1.getModel();
            tpago =(TipoPago) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (tpago.getIdtipo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Documento...");
        }
    }

    @Override
    public void grabar() {        
        tipoPagoService.registrar(tpago);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        tipoPagoService.actualizar(tpago);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (tpago.getIdtipo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Tipo Pago...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            tipoPagoService.eliminar(tpago);
            tpago=new TipoPago();
            Messagebox.show("El Tipo Pago Fue Eliminado", "Tipo Pago", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        txtSunat.setReadonly(enable);
        bCobro.setDisabled(enable);
        bPago.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winTipopago.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}

