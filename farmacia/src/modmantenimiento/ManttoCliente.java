package modmantenimiento;

import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.UbigeoService;
import com.zarcillo.service.UnidadNegocioService;
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
public class ManttoCliente extends SelectorComposer implements CrudListener{
    
    private Cliente cliente=new Cliente();
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    private ListModelList modeloUnidad;
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winCliente;
    
    @Wire
    private Combobox cboUnidad;
    
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
    ClienteService clienteService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winCliente")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winCliente.getFellow("menuMantto");
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
        modeloUnidad=new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin()));
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
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
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        ubigeo=(Ubigeo) modeloDistrito.getElementAt(cboDistrito.getSelectedIndex());
        cliente.setIdubigeo(ubigeo);
        cliente.setIdunidad(unidad);
        cliente.setCnomcli(txtNombre.getText().toUpperCase());
        cliente.setCruc(txtRuc.getText().toUpperCase());
        cliente.setCdircli(txtDireccion.getText().toUpperCase());  
        cliente.setCtelefono(txtTelefono.getText().toUpperCase());
        cliente.setCfax(txtFax.getText().toUpperCase());
        cliente.setCmovil(txtMovil.getText().toUpperCase());
        cliente.setIdusuario(usuario);
        cliente.setBagenteretencion(bRetencion.isChecked());
        cliente.setCcorreo(txtCorreo.getText());
        cliente.setCreferencia(txtObservacion.getText().toUpperCase());
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
        if (cliente.getIdcliente() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        cboUnidad.setSelectedIndex(modeloUnidad.indexOf(cliente.getIdunidad()));
        txtNombre.setText(cliente.getCnomcli());
        txtDireccion.setText(cliente.getCdircli());
        txtRuc.setText(cliente.getCruc());
        txtTelefono.setText(cliente.getCtelefono());
        txtFax.setText(cliente.getCfax());
        txtMovil.setText(cliente.getCmovil());
        txtCorreo.setText(cliente.getCcorreo());
        txtObservacion.setText(cliente.getCreferencia());
        if (cliente.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(cliente.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), cliente.getIdubigeo().getCprovincia());
            cboProvincia.setText(cliente.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(cliente.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
        bRetencion.setChecked(cliente.getBagenteretencion());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        cliente=new Cliente();
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
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedacliente.zul", null, null);
        winbuscaprod.setAttribute("UNIDAD", unidad);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstCliente");
            ListModel modelobuscado = lstproducto1.getModel();
            cliente =  (Cliente) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (cliente.getIdcliente() == null) {
            throw new ExceptionZarcillo("Debe Buscar Cliente...");
        }
    }

    @Override
    public void grabar() {        
        clienteService.registrar(cliente);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        clienteService.actualizar(cliente);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (cliente.getIdcliente() == null) {
            throw new ExceptionZarcillo("Debe Buscar Cliente...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            clienteService.eliminar(cliente);
            cliente = new Cliente();
            Messagebox.show("El Cliente Fue Eliminado", "Cliente", Messagebox.OK, Messagebox.INFORMATION);
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
        winCliente.onClose();
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
