package modmantenimiento;

import com.zarcillo.domain.Menu;
import com.zarcillo.domain.Modulo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.MenuService;
import com.zarcillo.service.ModuloService;
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
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoMenu extends SelectorComposer implements CrudListener{
    
    private Menu menu=new Menu();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    private ListModelList modeloModulo;
    
    @Wire
    private Window winMenu;
    
    @Wire
    private Combobox cboModulo;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtRuta;
    
    @Wire
    private Intbox nNivel1;
    
    @Wire
    private Intbox nNivel2;
    
    @Wire
    private Intbox nNivel3;
    
    @Wire
    private Intbox nOrden;
          
    @Wire
    private Checkbox bModal;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable            
    MenuService menuService;
    
    @WireVariable
    ModuloService moduloService;    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();  
    
    
    @Listen("onCreate=window#winMenu")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winMenu.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuta(Event event) {
        txtRuta.select();
    }

    @Listen("onOK = #txtRuta")
    public void onFocoNivel1(Event event) {
        nNivel1.select();
    }
    
    @Listen("onOK = #nNivel1")
    public void onFocoNivel2(Event event) {
        nNivel2.select();
    }
    
    @Listen("onOK = #nNivel2")
    public void onFocoNivel3(Event event) {
        nNivel3.select();
    }
    
    @Listen("onOK = #nNivel3")
    public void onFocoOrden(Event event) {
        nOrden.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloModulo=new ListModelList(moduloService.listaGeneral());
        cboModulo.setModel(modeloModulo);
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        Modulo modulo=(Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        menu.setIdmodulo(modulo);
        menu.setIdusuario(usuario);
        menu.setCnommenu(txtNombre.getText().toUpperCase());
        menu.setCruta(txtRuta.getText());
        menu.setBmodal(bModal.isChecked());
        menu.setNnivel1(nNivel1.getValue());
        menu.setNnivel2(nNivel2.getValue());
        menu.setNnivel3(nNivel3.getValue());
        menu.setNorden(nOrden.getValue());
    }
    
    
    @Override
    public void escribir() {
        if (menu.getIdmenu()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        cboModulo.setSelectedIndex(modeloModulo.indexOf(menu.getIdmodulo()));
        txtNombre.setText(menu.getCnommenu());
        txtRuta.setText(menu.getCruta());
        nNivel1.setValue(menu.getNnivel1());
        nNivel2.setValue(menu.getNnivel2());
        nNivel3.setValue(menu.getNnivel3());
        nOrden.setValue(menu.getNorden());        
        bModal.setChecked(menu.getBmodal());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        menu=new Menu();
        cboModulo.setText("");
        cboModulo.setSelectedIndex(-1);
        txtNombre.setText("");
        txtRuta.setText("");
        nNivel1.setValue(1);
        nNivel2.setValue(0);
        nNivel3.setValue(0);
        nOrden.setValue(0);
        bModal.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedamenu.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstMenu");
            ListModel modelobuscado = lstproducto1.getModel();
            menu =  (Menu) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (menu.getIdmenu() == null) {
            throw new ExceptionZarcillo("Debe Buscar Menu...");
        }
    }

    @Override
    public void grabar() {        
        menuService.registrar(menu);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        menuService.actualizar(menu);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (menu.getIdmenu() == null) {
            throw new ExceptionZarcillo("Debe Buscar Menu...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            menuService.eliminar(menu);
            menu = new Menu();
            Messagebox.show("El Menu Fue Eliminado", "Menu", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        cboModulo.setDisabled(enable);
        txtNombre.setReadonly(enable);
        txtRuta.setReadonly(enable);
        nNivel1.setReadonly(enable);
        nNivel2.setReadonly(enable);
        nNivel3.setReadonly(enable);
        nOrden.setReadonly(enable);
        bModal.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboModulo.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winMenu.onClose();
    }   

    public void agregarConstraint() {
        cboModulo.setConstraint(new ConstraintCamposObligatorios());
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboModulo.setConstraint("");
        txtNombre.setConstraint("");
    }   
}
