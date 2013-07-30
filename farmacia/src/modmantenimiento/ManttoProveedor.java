package modmantenimiento;

import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ProveedorService;
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
public class ManttoProveedor extends SelectorComposer implements CrudListener{
    
    private Proveedor proveedor=new Proveedor();
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winProveedor;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Textbox txtRuc;
        
    @Wire
    private Combobox cboDepartamento;
    
    @Wire
    private Combobox cboProvincia;
    
    @Wire
    private Combobox cboDistrito;
    
    @Wire
    private Textbox txtTelefono;
    
    @Wire
    private Textbox txtFax;
    
    @Wire
    private Textbox txtMovil;
    
    @Wire
    private Textbox txtCorreo;
    
    @Wire
    private Textbox txtUrl;
    
    @Wire
    private Checkbox bRetencion;
    
    @Wire
    private Textbox txtObservacion;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    ProveedorService proveedorService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winProveedor")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winProveedor/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        txtRuc.select();
    }
    
         
    @Listen("onOK = #txtRuc")
    public void onFocoDireccion(Event event) {
        txtDireccion.select();
    }
    
    @Listen("onOK = #txtDireccion")
    public void onFocoDepartamento(Event event) {
        cboDepartamento.focus();
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
        verificarDocumento();
        ubigeo=(Ubigeo) modeloDistrito.getElementAt(cboDistrito.getSelectedIndex());
        proveedor.setIdubigeo(ubigeo);
        proveedor.setCnomprovee(txtNombre.getText().toUpperCase());
        proveedor.setCruc(txtRuc.getText().toUpperCase());
        proveedor.setCdireccion(txtDireccion.getText().toUpperCase());  
        proveedor.setCtelefono(txtTelefono.getText().toUpperCase());
        proveedor.setCfax(txtFax.getText().toUpperCase());
        proveedor.setCmovil(txtMovil.getText().toUpperCase());
        proveedor.setIdusuario(usuario);
        proveedor.setBretencion(bRetencion.isChecked());
        proveedor.setCcorreo(txtCorreo.getText());
        proveedor.setCurl(txtUrl.getText());
        proveedor.setCobservacion(txtObservacion.getText().toUpperCase());
    }
    
    private void verificarDocumento(){
        if(!txtRuc.getText().trim().isEmpty()){
            if(txtRuc.getText().trim().length()!=11||!isNumberFloat(txtRuc.getText().trim())){
                throw new ExceptionZarcillo("RUC Incorrecto");
            }
        }
    }
    
    public static boolean isNumberFloat(String cadena) {
        try {
            Float.parseFloat(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    @Override
    public void escribir() {
        if (proveedor.getIdproveedor() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(proveedor.getCnomprovee());
        txtDireccion.setText(proveedor.getCdireccion());
        txtRuc.setText(proveedor.getCruc());
        txtTelefono.setText(proveedor.getCtelefono());
        txtFax.setText(proveedor.getCfax());
        txtMovil.setText(proveedor.getCmovil());
        txtCorreo.setText(proveedor.getCcorreo());
        txtUrl.setText(proveedor.getCurl());
        txtObservacion.setText(proveedor.getCobservacion());
        if (proveedor.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(proveedor.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), proveedor.getIdubigeo().getCprovincia());
            cboProvincia.setText(proveedor.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(proveedor.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
        bRetencion.setChecked(proveedor.getBretencion());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        proveedor=new Proveedor();
        txtDireccion.setText("");
        txtFax.setText("");
        txtMovil.setText("");
        txtNombre.setText("");
        txtRuc.setText("");
        txtTelefono.setText("");
        cboDepartamento.setSelectedIndex(-1);
        cboProvincia.setText("");
        cboProvincia.setSelectedIndex(-1);
        cboDistrito.setText("");
        cboDistrito.setSelectedIndex(-1);        
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproveedor.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstProveedor");
            ListModel modelobuscado = lstproducto1.getModel();
            proveedor =  (Proveedor) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (proveedor.getIdproveedor() == null) {
            throw new ExceptionZarcillo("Debe Buscar Empresa...");
        }
    }

    @Override
    public void grabar() {        
        proveedorService.registrar(proveedor);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        proveedorService.actualizar(proveedor);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (proveedor.getIdproveedor() == null) {
            throw new ExceptionZarcillo("Debe Buscar Proveedor...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            proveedorService.eliminar(proveedor);
            proveedor = new Proveedor();
            Messagebox.show("El Proveedor Fue Eliminado", "Proveedor", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        txtRuc.setReadonly(enable);
        txtDireccion.setReadonly(enable);
        txtFax.setReadonly(enable);
        txtMovil.setReadonly(enable);
        txtTelefono.setReadonly(enable);
        txtCorreo.setReadonly(enable);
        txtUrl.setReadonly(enable);
        txtObservacion.setReadonly(enable);
        bRetencion.setDisabled(enable);
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
        winProveedor.onClose();
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
