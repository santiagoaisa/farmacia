package modmantenimiento;

import com.zarcillo.domain.Vendedor;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.VendedorService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UbigeoService;
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
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoVendedor extends SelectorComposer implements CrudListener{
    
    private Vendedor vendedor=new Vendedor();
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winVendedor;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Textbox txtAbrev;
        
    @Wire
    private Combobox cboDepartamento;
    
    @Wire
    private Combobox cboProvincia;
    
    @Wire
    private Combobox cboDistrito;
    
    @Wire
    private Textbox txtTelefono;
    
    @Wire
    private Textbox txtMovil;
    
    @Wire
    private Checkbox bActivo;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    VendedorService vendedorService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winVendedor")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winVendedor/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoAbrev(Event event) {
        txtAbrev.select();
    }
         
    @Listen("onOK = #txtAbrev")
    public void onFocoDireccion(Event event) {
        txtDireccion.select();
    }
    
    @Listen("onOK = #cboDepartamento")
    public void onFocoProvincia(Event event) {
        cboProvincia.focus();
    }
    
    @Listen("onOK = #cboProvincia")
    public void onFocoDistrito(Event event) {
        cboDistrito.focus();
    }
    
    @Listen("onChange = #cboDepartamento")
    public void onEventoProvincia(Event event) {
        eligeDepartamento();
        cboProvincia.focus();
    }
    
    @Listen("onChange= #cboProvincia")
    public void onEventoDistrito(Event event) {
        eligeProvincia();
        cboDistrito.focus();
    }
    
       
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloDepartamento=new ListModelList(ubigeoService.listaDepartamento());
        cboDepartamento.setModel(modeloDepartamento);
        modeloProvincia=new ListModelList();
        cboProvincia.setModel(modeloProvincia);
        modeloDistrito=new ListModelList();
        cboDistrito.setModel(modeloDistrito);
        habilitar(true);
    }
    
    private void eligeDepartamento() {
        /////// quito contraint combos
        cboProvincia.setConstraint("");
        cboDistrito.setConstraint("");
        udepartamento = (Ubigeo) modeloDepartamento.getElementAt(cboDepartamento.getSelectedIndex());
        iniciaProvincia();
        cboProvincia.setText("");
        cboDistrito.setText("");
        modeloDistrito=new ListModelList();
        cboProvincia.setConstraint(new ConstraintCamposObligatorios());
        cboDistrito.setConstraint(new ConstraintCamposObligatorios());
    }

    private void eligeProvincia() {
        cboDistrito.setConstraint("");
        uprovincia = (Ubigeo) modeloProvincia.getElementAt(cboProvincia.getSelectedIndex());
        iniciaDistrito();
        cboDistrito.setText("");
        cboDistrito.setConstraint(new ConstraintCamposObligatorios());
    }

    private void iniciaDistrito() {
        modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
        cboDistrito.setModel(modeloDistrito);
    }

    private void iniciaProvincia() {
        modeloProvincia = new ListModelList(ubigeoService.listaProvincia(udepartamento.getCdepartamento()));
        cboProvincia.setModel(modeloProvincia);
    }

    @Override
    public void leer() {     
        ubigeo=(Ubigeo) modeloDistrito.getElementAt(cboDistrito.getSelectedIndex());
        vendedor.setIdubigeo(ubigeo);
        vendedor.setCnomvendedor(txtNombre.getText().toUpperCase());
        vendedor.setCabrev(txtAbrev.getText().toUpperCase());
        vendedor.setCdireccion(txtDireccion.getText().toUpperCase());  
        vendedor.setCtelefono(txtTelefono.getText().toUpperCase());
        vendedor.setCmovil(txtMovil.getText().toUpperCase());
        vendedor.setBactivo(bActivo.isChecked());
        vendedor.setIdusuario(usuario);
    }
    
    @Override
    public void escribir() {
        if (vendedor.getIdvendedor() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(vendedor.getCnomvendedor());
        txtDireccion.setText(vendedor.getCdireccion());
        txtAbrev.setText(vendedor.getCabrev());
        txtTelefono.setText(vendedor.getCtelefono());
        txtMovil.setText(vendedor.getCmovil());
        bActivo.setChecked(vendedor.getBactivo());
        if (vendedor.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(vendedor.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), vendedor.getIdubigeo().getCprovincia());
            cboProvincia.setText(vendedor.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(vendedor.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        vendedor=new Vendedor();
        txtDireccion.setText("");
        txtAbrev.setText("");
        txtMovil.setText("");
        txtNombre.setText("");
        txtTelefono.setText("");
        cboDepartamento.setSelectedIndex(-1);
        cboProvincia.setText("");
        cboProvincia.setSelectedIndex(-1);
        cboDistrito.setText("");
        cboDistrito.setSelectedIndex(-1);    
        bActivo.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedavendedor.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstVendedor");
            ListModel modelobuscado = lstproducto1.getModel();
            vendedor =  (Vendedor) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (vendedor.getIdvendedor() == null) {
            throw new ExceptionZarcillo("Debe Buscar Vendedor...");
        }
    }

    @Override
    public void grabar() {        
        vendedorService.registrar(vendedor);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        vendedorService.actualizar(vendedor);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (vendedor.getIdvendedor()== null) {
            throw new ExceptionZarcillo("Debe Buscar Vendedor...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            vendedorService.eliminar(vendedor);
            vendedor = new Vendedor();
            Messagebox.show("El Vendedor Fue Eliminado", "Vendedor", Messagebox.OK, Messagebox.INFORMATION);
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
        txtDireccion.setReadonly(enable);
        txtMovil.setReadonly(enable);
        txtTelefono.setReadonly(enable);
        bActivo.setDisabled(enable);
        cboDepartamento.setDisabled(enable);
        cboProvincia.setDisabled(enable);
        cboDistrito.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboDepartamento.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winVendedor.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        cboDepartamento.setConstraint(new ConstraintCamposObligatorios());

    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        cboDepartamento.setConstraint("");
        cboProvincia.setConstraint("");
        cboDistrito.setConstraint("");
    }
   
}

