package modmantenimiento;

import com.zarcillo.domain.Empresa;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.EmpresaService;
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
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoUnidad extends SelectorComposer implements CrudListener{
    
    private UnidadNegocio unidad=new UnidadNegocio();    
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    private ListModelList modeloEmpresa;
    
    @Wire
    private Window winUnidad;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtAbrev;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Combobox cboEmpresa;
    
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
    EmpresaService empresaService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winUnidad")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winUnidad/menuMantto");
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
        modeloEmpresa=new ListModelList(empresaService.listaGeneral());
        cboEmpresa.setModel(modeloEmpresa);
        if(modeloEmpresa.getSize()>0){
            cboEmpresa.onInitRender(new Event("", cboEmpresa));
            cboEmpresa.setSelectedIndex(0);
            cboEmpresa.close();
        }
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
        Empresa empresa=(Empresa) modeloEmpresa.getElementAt(cboEmpresa.getSelectedIndex());
        unidad.setIdubigeo(ubigeo);
        unidad.setIdempresa(empresa);
        unidad.setCabrev(txtAbrev.getText());
        unidad.setCnomunidad(txtNombre.getText().toUpperCase());
        unidad.setCdireccion(txtDireccion.getText().toUpperCase()); 
        unidad.setIdusuario(usuario);
    }
    
    @Override
    public void escribir() {
        if (unidad.getIdunidad() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtAbrev.setText(unidad.getCabrev());
        txtNombre.setText(unidad.getCnomunidad());
        txtDireccion.setText(unidad.getCdireccion());
        if (unidad.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(unidad.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), unidad.getIdubigeo().getCprovincia());
            cboProvincia.setText(unidad.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(unidad.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
        cboEmpresa.setSelectedIndex(modeloEmpresa.indexOf(unidad.getIdempresa()));
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        unidad=new UnidadNegocio();
        txtDireccion.setText("");
        txtNombre.setText("");
        txtAbrev.setText("");
        cboDepartamento.setSelectedIndex(-1);
        cboProvincia.setText("");
        cboProvincia.setSelectedIndex(-1);
        cboDistrito.setText("");
        cboDistrito.setSelectedIndex(-1);        
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaunidad.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstbusqueda = (Listbox) winbuscaprod.getFellow("lstUnidad");
            ListModel modelobuscado = lstbusqueda.getModel();
            unidad =   (UnidadNegocio) modelobuscado.getElementAt(lstbusqueda.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (unidad.getIdunidad() == null) {
            throw new ExceptionZarcillo("Debe Buscar Unidad...");
        }
    }

    @Override
    public void grabar() {        
        unidadNegocioService.registrar(unidad);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        unidadNegocioService.actualizar(unidad);
        Messagebox.show("Actualizacion Satisfactoria");
    }

    @Override
    public void eliminar() {
        if (unidad.getIdunidad() == null) {
            throw new ExceptionZarcillo("Debe Buscar Unidad Negocio...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            unidadNegocioService.eliminar(unidad);
            unidad = new UnidadNegocio();
            Messagebox.show("La Unidad de Negocio Fue Eliminada", "Unidad Negocio", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtAbrev.setReadonly(enable);
        txtNombre.setReadonly(enable);
        txtDireccion.setReadonly(enable);
        cboEmpresa.setDisabled(enable);
        cboDepartamento.setDisabled(enable);
        cboProvincia.setDisabled(enable);
        cboDistrito.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboEmpresa.getValue();
        cboDepartamento.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winUnidad.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        cboDepartamento.setConstraint(new ConstraintCamposObligatorios());
        cboEmpresa.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        cboDepartamento.setConstraint("");
        cboProvincia.setConstraint("");
        cboDistrito.setConstraint("");
        cboEmpresa.setConstraint("");
    }   
}