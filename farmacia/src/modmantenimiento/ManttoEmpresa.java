package modmantenimiento;

import com.zarcillo.domain.Empresa;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.EmpresaService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UbigeoService;
import com.zarcillo.service.UsuarioService;
import java.util.Date;
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
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Image;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoEmpresa extends SelectorComposer implements CrudListener{
    
    private Empresa empresa=new Empresa();
    private Usuario usuario;    
    private Ubigeo ubigeo;
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winEmpresa;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Textbox txtRuc;
    
    @Wire
    private Datebox dFecha;
    
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
    private Image logo;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    EmpresaService empresaService;
    
    @WireVariable
    UbigeoService ubigeoService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winEmpresa")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winEmpresa/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        txtRuc.select();
    }
    
    @Listen("onOK = #txtRuc")
    public void onFocoFecha(Event event) {
        dFecha.focus();
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
        dFecha.setValue(new Date());        
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
        verificarDocumento();
        ubigeo=(Ubigeo) modeloDistrito.getElementAt(cboDistrito.getSelectedIndex());
        empresa.setIdubigeo(ubigeo);
        empresa.setCnomempresa(txtNombre.getText().toUpperCase());
        empresa.setCruc(txtRuc.getText().toUpperCase());
        empresa.setCdireccion(txtDireccion.getText().toUpperCase());  
        empresa.setCtelefono(txtTelefono.getText().toUpperCase());
        empresa.setCfax(txtFax.getText().toUpperCase());
        empresa.setCmovil(txtMovil.getText().toUpperCase());
        empresa.setIdusuario(usuario);
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
        if (empresa.getIdempresa() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(empresa.getCnomempresa());
        txtDireccion.setText(empresa.getCdireccion());
        txtRuc.setText(empresa.getCruc());
        txtTelefono.setText(empresa.getCtelefono());
        txtFax.setText(empresa.getCfax());
        txtMovil.setText(empresa.getCmovil());
        if (empresa.getIdubigeo() != null) {
            udepartamento = ubigeoService.buscarDepartamento(empresa.getIdubigeo().getCdepartamento());
            uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), empresa.getIdubigeo().getCprovincia());
            cboProvincia.setText(empresa.getIdubigeo().getCnomprovincia());
            cboDistrito.setText(empresa.getIdubigeo().getCubigeo());
            cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));
            modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
            cboDistrito.setModel(modeloDistrito);
        }
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        empresa=new Empresa();
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
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaempresa.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstEmpresa");
            ListModel modelobuscado = lstproducto1.getModel();
            empresa =  (Empresa) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (empresa.getIdempresa() == null) {
            throw new ExceptionZarcillo("Debe Buscar Empresa...");
        }
    }

    @Override
    public void grabar() {        
        empresaService.registrar(empresa);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        empresaService.actualizar(empresa);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (empresa.getIdempresa()== null) {
            throw new ExceptionZarcillo("Debe Buscar Empresa...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            empresaService.eliminar(empresa);
            empresa = new Empresa();
            Messagebox.show("La Empresa Fue Eliminada", "Empresa", Messagebox.OK, Messagebox.INFORMATION);
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
        dFecha.setDisabled(enable);
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
        winEmpresa.onClose();
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

