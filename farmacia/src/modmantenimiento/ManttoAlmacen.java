package modmantenimiento;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExceptionZarcillo;
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
public class ManttoAlmacen extends SelectorComposer implements CrudListener{
    
    private Almacen almacen=new Almacen();    
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    private ListModelList modeloUnidad;
    
    @Wire
    private Window winAlmacen;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Checkbox bPrincipal;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Combobox cboUnidad;
    
    @Wire
    private Combobox cboDepartamento;
    
    @Wire
    private Combobox cboProvincia;
    
    @Wire
    private Combobox cboDistrito;
    
      
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winAlmacen")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winAlmacen.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
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
        modeloUnidad=new ListModelList(unidadNegocioService.listaGeneral());
        cboUnidad.setModel(modeloUnidad);
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
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        almacen.setIdubigeo(ubigeo);
        almacen.setIdunidad(unidad);
        almacen.setBprincipal(bPrincipal.isChecked());
        almacen.setCnomalmacen(txtNombre.getText().toUpperCase());
        almacen.setCdireccion(txtDireccion.getText().toUpperCase()); 
        almacen.setIdusuario(usuario);
    }
    
    @Override
    public void escribir() {
        if (almacen.getIdalmacen() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        bPrincipal.setChecked(almacen.getBprincipal());
        txtNombre.setText(almacen.getCnomalmacen());
        txtDireccion.setText(almacen.getCdireccion());
        if (almacen.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(almacen.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), almacen.getIdubigeo().getCprovincia());
            cboProvincia.setText(almacen.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(almacen.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
        cboUnidad.setSelectedIndex(modeloUnidad.indexOf(almacen.getIdunidad()));
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        almacen=new Almacen();
        txtDireccion.setText("");
        txtNombre.setText("");
        bPrincipal.setChecked(false);
        cboDepartamento.setSelectedIndex(-1);
        cboProvincia.setText("");
        cboProvincia.setSelectedIndex(-1);
        cboDistrito.setText("");
        cboDistrito.setSelectedIndex(-1);        
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaalmacen.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstbusqueda = (Listbox) winbuscaprod.getFellow("lstAlmacen");
            ListModel modelobuscado = lstbusqueda.getModel();
            almacen =    (Almacen) modelobuscado.getElementAt(lstbusqueda.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (almacen.getIdalmacen() == null) {
            throw new ExceptionZarcillo("Debe Buscar Almacen...");
        }
    }

    @Override
    public void grabar() {    
        almacenService.registrar(almacen);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        almacenService.actualizar(almacen);
        Messagebox.show("Actualizacion Satisfactoria");
    }

    @Override
    public void eliminar() {
        if (almacen.getIdalmacen() == null) {
            throw new ExceptionZarcillo("Debe Buscar Almacen...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            almacenService.eliminar(almacen);
            almacen = new Almacen();
            Messagebox.show("El almacen fue eliminado", "Almacen", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        bPrincipal.setDisabled(enable);
        txtNombre.setReadonly(enable);
        txtDireccion.setReadonly(enable);
        cboUnidad.setDisabled(enable);
        cboDepartamento.setDisabled(enable);
        cboProvincia.setDisabled(enable);
        cboDistrito.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboUnidad.getValue();
        cboDepartamento.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winAlmacen.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        cboDepartamento.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        cboDepartamento.setConstraint("");
        cboProvincia.setConstraint("");
        cboDistrito.setConstraint("");
        cboUnidad.setConstraint("");
    }   
}