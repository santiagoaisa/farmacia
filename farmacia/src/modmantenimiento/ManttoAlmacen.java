package modmantenimiento;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Ubigeo;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.UbigeoService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ManttoAlmacen extends SelectorComposer implements CrudListener{
    
    private Almacen almacen=new Almacen();
    private Usuario usuario;    
    private Ubigeo udepartamento;
    private Ubigeo uprovincia;
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloUnidad;
    private ListModelList modeloDepartamento;
    private ListModelList modeloProvincia;
    private ListModelList modeloDistrito;
    
    @Wire
    private Window winAlmacen;
    
    @Wire
    private Combobox cboUnidad;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtDireccion;
    
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
    UbigeoService ubigeoService;
    
    @WireVariable
    AlmacenService almacenService;
    
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winAlmacen")
    public void onCreate() throws NamingException {
         HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winAlmacen/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
         cboUnidad.focus();
     }
     
    @Listen("onOK = #cboUnidad")
    public void onFocoNombre(Event event) {
        txtNombre.select();
    }
     
    @Listen("onOK = #txtNombre")
    public void onFocoDireccion(Event event) {
        txtDireccion.select();
    }
    
    @Listen("onOK = #txtDireccion")
    public void onFocoDepartamento(Event event) {
        cboDepartamento.focus();        
    }
    
    @Listen("onChange = #cboDepartamento")
    public void onFocoProvincia(Event event) {
        eligeDepartamento();
        cboProvincia.focus();
    }
    
    @Listen("onChange= #cboProvincia")
    public void onFocoDistrito(Event event) {
        eligeProvincia();
        cboDistrito.focus();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloUnidad=new ListModelList(unidadNegocioService.listaGeneral());
        cboUnidad.setModel(modeloUnidad);
        modeloDepartamento=new ListModelList(ubigeoService.listaDepartamento());
        cboDepartamento.setModel(modeloDepartamento);
        modeloProvincia=new ListModelList();
        cboProvincia.setModel(modeloProvincia);
        modeloDistrito=new ListModelList();
        cboDistrito.setModel(modeloDistrito);
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
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Ubigeo ubigeo=(Ubigeo) modeloDistrito.getElementAt(cboDistrito.getSelectedIndex());
        almacen.setIdunidad(unidad);
        almacen.setIdubigeo(ubigeo);
        almacen.setCnomalmacen(txtNombre.getText().toUpperCase());
        almacen.setCdireccion(txtDireccion.getText().toUpperCase());  
    }

    @Override
    public void escribir() {
        if (almacen.getIdalmacen() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        cboUnidad.setSelectedIndex(modeloUnidad.indexOf(almacen.getIdunidad()));
        txtNombre.setText(almacen.getCnomalmacen());
        txtDireccion.setText(almacen.getCdireccion());
        if(almacen.getIdubigeo() != null) {
                udepartamento = ubigeoService.buscarDepartamento(almacen.getIdubigeo().getCdepartamento());
                uprovincia = ubigeoService.buscarProvincia(udepartamento.getCdepartamento(), almacen.getIdubigeo().getCprovincia());
                
                cboProvincia.setText(almacen.getIdubigeo().getCnomprovincia());
                cboDistrito.setText(almacen.getIdubigeo().getCubigeo());
                cboDepartamento.setSelectedIndex(modeloDepartamento.indexOf(udepartamento));

                modeloDistrito = new ListModelList(ubigeoService.listaDistrito(udepartamento.getCdepartamento(), uprovincia.getCprovincia()));
                cboDistrito.setModel(modeloDistrito);
            }
    }

    @Override
    public void limpiar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaalmacen.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstAlmacen");
            ListModel modelobuscado = lstproducto1.getModel();
            almacen = (Almacen) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void grabar() {
        almacen.setIdusuario(usuario);
        almacenService.registrar(almacen);
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizar() {
        almacen.setIdusuario(usuario);
        almacenService.actualizar(almacen);        
    }

    @Override
    public void eliminar() {
        if (almacen.getIdalmacen() == null) {
            try {
                throw new Exception("Debe Buscar Un Cliente...");
            } catch (Exception ex) {
                Logger.getLogger(ManttoAlmacen.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            almacenService.eliminar(almacen);
            almacen = new Almacen();
            Messagebox.show("El Almacen fue eliminado", "Almacenes", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        cboUnidad.setDisabled(enable);
        cboDepartamento.setDisabled(enable);
        cboProvincia.setDisabled(enable);
        cboDistrito.setDisabled(enable);
        txtNombre.setReadonly(enable);
        txtDireccion.setReadonly(enable);
    }

    @Override
    public void validarDatos() {
        cboUnidad.getValue();
        cboDistrito.getValue();
    }

    @Override
    public void salir() {
        winAlmacen.onClose();
    }   

     public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
        cboDepartamento.setConstraint(new ConstraintCamposObligatorios());

    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        cboUnidad.setConstraint("");
        cboDepartamento.setConstraint("");
        cboProvincia.setConstraint("");
        cboDistrito.setConstraint("");
    }
   
}
