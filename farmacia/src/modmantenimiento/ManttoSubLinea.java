package modmantenimiento;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.SublineaService;
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
public class ManttoSubLinea extends SelectorComposer implements CrudListener{
    
    private Sublinea sublinea=new Sublinea();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;  
    
    private ListModelList modeloLinea;
    
    
    @Wire
    private Window winSublinea;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Combobox cboLinea;
    
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    LineaService lineaService;
    
    @WireVariable
    SublineaService sublineaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winSublinea")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winSublinea/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        cboLinea.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloLinea=new ListModelList(lineaService.listaGeneral());
        cboLinea.setModel(modeloLinea);
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        Linea linea =(Linea) modeloLinea.getElementAt(cboLinea.getSelectedIndex());
        sublinea.setCnomsublinea(txtNombre.getText().toUpperCase());
        sublinea.setIdusuario(usuario);
        sublinea.setIdlinea(linea);
    }
    
    
    @Override
    public void escribir() {
        if (sublinea.getIdsublinea()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(sublinea.getCnomsublinea());      
        cboLinea.setSelectedIndex(modeloLinea.indexOf(sublinea.getIdlinea()));
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        sublinea=new Sublinea();
        txtNombre.setText("");
        cboLinea.setSelectedIndex(-1);
        cboLinea.setText("");
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedasublinea.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstSublinea");
            ListModel modelobuscado = lstproducto1.getModel();
            sublinea=  (Sublinea) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (sublinea.getIdsublinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar Sublinea...");
        }
    }

    @Override
    public void grabar() {        
        sublineaService.registrar(sublinea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        sublineaService.actualizar(sublinea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (sublinea.getIdsublinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar Sublinea...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            sublineaService.eliminar(sublinea);
            sublinea = new Sublinea();
            Messagebox.show("La Sublinea Fue Eliminada", "Sublinea", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        cboLinea.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboLinea.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winSublinea.onClose();
    }   

    public void agregarConstraint() {
        cboLinea.setConstraint(new ConstraintCamposObligatorios());
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboLinea.setConstraint("");
        txtNombre.setConstraint("");
    }   
}
