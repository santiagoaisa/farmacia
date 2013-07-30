package modmantenimiento;

import com.zarcillo.domain.Banco;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.BancoService;
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
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoBanco extends SelectorComposer implements CrudListener{
    
    private Banco banco=new Banco();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;  
    
    private ListModelList modeloMoneda;
    
    
    @Wire
    private Window winBanco;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Combobox cboMoneda;
    
    @Wire
    private Textbox txtSunat;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    MonedaService monedaService;
    
    @WireVariable
    BancoService bancoService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winBanco")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winBanco/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        txtSunat.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloMoneda=new ListModelList(monedaService.listaGeneral());
        cboMoneda.setModel(modeloMoneda);
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        Moneda moneda=(Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
        banco.setCnombanco(txtNombre.getText().toUpperCase());
        banco.setCcodigosunat(txtSunat.getText());
        banco.setIdusuario(usuario);
        banco.setIdmoneda(moneda);
    }
    
    
    @Override
    public void escribir() {
        if (banco.getIdbanco()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(banco.getCnombanco());
        txtSunat.setText(banco.getCcodigosunat());        
        cboMoneda.setSelectedIndex(modeloMoneda.indexOf(banco.getIdmoneda()));
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        banco=new Banco();
        txtNombre.setText("");
        txtSunat.setText("");
        cboMoneda.setSelectedIndex(-1);
        cboMoneda.setText("");
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedabanco.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstBanco");
            ListModel modelobuscado = lstproducto1.getModel();
            banco =  (Banco) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (banco.getIdbanco() == null) {
            throw new ExceptionZarcillo("Debe Buscar Banco...");
        }
    }

    @Override
    public void grabar() {        
        bancoService.registrar(banco);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        bancoService.actualizar(banco);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (banco.getIdbanco() == null) {
            throw new ExceptionZarcillo("Debe Buscar Banco...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            bancoService.eliminar(banco);
            banco = new Banco();
            Messagebox.show("El Banco Fue Eliminado", "Banco", Messagebox.OK, Messagebox.INFORMATION);
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
        cboMoneda.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboMoneda.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winBanco.onClose();
    }   

    public void agregarConstraint() {
        cboMoneda.setConstraint(new ConstraintCamposObligatorios());
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboMoneda.setConstraint("");
        txtNombre.setConstraint("");
    }   
}
