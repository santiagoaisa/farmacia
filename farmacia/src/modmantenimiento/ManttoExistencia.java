package modmantenimiento;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoExistencia extends SelectorComposer {
    
    private Usuario usuario;    
    private MenuMantenimiento menuMantto; 
    private Existencia existencia=new Existencia();
    
    private ListModelList modeloAlmacen;
    
    @Wire
    private Window winManttoExistencia;
    
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Textbox txtLinea;
    @Wire
    private Textbox txtUbicacion;
    @Wire    
    private Textbox txtNombre;    
    @Wire
    private Textbox txtCodigo;
    @Wire
    private Intbox nFraccion;
    @Wire
    private Intbox nStock;
    @Wire
    private Intbox nStockm;    
    @Wire
    private Textbox txtReceta;
    @Wire
    private Toolbarbutton btnModificar;
    @Wire
    private Toolbarbutton btnRegistrar;
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    ProductoService productoService;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    ExistenciaService existenciaService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winManttoExistencia")
    public void onCreate() throws NamingException {        
         initComponets();
     }
     
    @Listen("onOK = #txtCodigo")
    public void onFocoNombre(Event event) {
        buscarProducto();
    }
    
    @Listen("onClick = #btnModificar")
    public void onModificar(Event event) {
        modificar();
    }
    
    @Listen("onClick = #btnRegistrar")
    public void onRegistrar(Event event) {
        grabar();
    }
    
    @Listen("onClick = #btnIgnorar")
    public void onIgnorar(Event event) {
        limpiar();
    }
    
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winManttoExistencia.onClose();
    }
    
     
         
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);

        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
       txtCodigo.focus();
       txtCodigo.setReadonly(false);   
       btnRegistrar.setDisabled(true);
       btnModificar.setDisabled(true);
    }    
    public void buscarProducto() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        if (txtCodigo.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/buscaexistenciaalmacen.zul", null, null);
                winbuscaprod.setAttribute("ALMACEN", almacen);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstexistencia = (Listbox) winbuscaprod.getFellow("lstExistencia");
                    ListModel modelobuscado = lstexistencia.getModel();
                    existencia = (Existencia) modelobuscado.getElementAt(lstexistencia.getSelectedIndex());
                    escribir();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            existencia = existenciaService.buscarPorIdalmacenPorIdproducto(almacen.getIdalmacen(),txtCodigo.getText().trim());
            escribir();
        }
    }



    public void escribir() {
        txtCodigo.setText(existencia.getIdproducto().getIdproducto());
        txtNombre.setText(existencia.getIdproducto().getCnomproducto());
        txtLinea.setText(existencia.getIdproducto().getIdsublinea().getIdlinea().getCnomlinea());
        txtUbicacion.setText(existencia.getCubicacion());      
        txtReceta.setText(existencia.getIdproducto().getCreseta());
        nFraccion.setValue(existencia.getIdproducto().getNmenudeo());   
        nStock.setValue(existencia.getNstock());
        nStockm.setValue(existencia.getNstockm());
        btnRegistrar.setDisabled(true);
        btnModificar.setDisabled(false);
    }
    
    private void modificar(){
        btnRegistrar.setDisabled(false);
        btnModificar.setDisabled(true);
        habilitar(false);        
    }
    private void habilitar(boolean enable){
        txtNombre.setReadonly(enable);
        txtUbicacion.setReadonly(enable);
        txtReceta.setReadonly(enable);
        nFraccion.setReadonly(enable);
    }

    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        existencia=new Existencia();
        txtCodigo.setText("");
        txtNombre.setText("");
        txtLinea.setText("");
        txtReceta.setText("");
        nStock.setValue(0);
        nStockm.setValue(0);
        nFraccion.setValue(1);
        txtCodigo.focus();
        btnRegistrar.setDisabled(true);
        btnModificar.setDisabled(true);
        agregarConstraint();
    }

   
    public void grabar() {   
        Producto producto=new Producto();
        producto=existencia.getIdproducto();
        producto.setCnomproducto(txtNombre.getText().toUpperCase());
        producto.setNmenudeo(nFraccion.getValue());
        producto.setCreseta(txtReceta.getText().toUpperCase());
        existencia.setIdproducto(producto);
        existencia.setCubicacion(txtUbicacion.getText().toUpperCase());        
        existenciaService.actualizar(existencia);        
        Messagebox.show("Registro Satisfactorio");
        btnRegistrar.setDisabled(true);
        btnModificar.setDisabled(false);
    }
 

    public void agregarConstraint() {
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboAlmacen.setConstraint("");
        txtNombre.setConstraint("");
    }   
}

