package modalmacen.registro;

import com.zarcillo.domain.Familia;
import com.zarcillo.domain.Presentacion;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Sublinea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.FamiliaService;
import com.zarcillo.service.PresentacionService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.SublineaService;
import com.zarcillo.service.UsuarioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class NuevoProductoIngreso extends SelectorComposer {
    
    private Producto producto=new Producto();
    private Usuario usuario;    
    
    private ListModelList modeloSublinea;
    private ListModelList modeloFamilia;
    private ListModelList modeloPresentacion;
    
    @Wire
    private Window winProducto;
    
    @Wire    
    private Textbox txtNomPro;
        
    @Wire
    private Intbox nFraccion;
    
    @Wire
    private Textbox txtBarras;
    
    @Wire
    private Combobox cboSublinea;
    
    @Wire
    private Combobox cboFamilia;
    
    @Wire
    private Combobox cboPresentacion;    
       
    @Wire
    private Checkbox bInafecto;
    
    @Wire
    private Checkbox bPsicotropico;
    
    @Wire
    private Textbox txtReceta;
    
    @Wire
    private Toolbarbutton  btnRegistrar3;
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    ProductoService productoService;
    
    @WireVariable
    SublineaService sublineaService;
    
    @WireVariable
    FamiliaService familiaService;
    
    @WireVariable
    PresentacionService presentacionService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winProducto")
    public void onCreate() throws NamingException {
         initComponets();
     }
    
    @Listen("onOK = #txtNomPro")
    public void onFocoFraccion(Event event) {
        nFraccion.select();
    }
    
    @Listen("onOK = #nFraccion")
    public void onFocoSublinea(Event event) {
        cboSublinea.select();
    }
    
    @Listen("onOK = #cboSublinea")
    public void onFocoFamilia(Event event) {
        cboFamilia.focus();
    }
    
    @Listen("onOK = #cboFamilia")    
    public void onFocoPresentacion(Event event) {
        cboPresentacion.focus();
    }
    
    @Listen("onOK = #cboPresentacion")
    public void onFocoBarras(Event event) {
        txtBarras.focus();
    }
    
    @Listen("onOK = #txtBarras")
    public void onFocoReceta(Event event) {
        txtReceta.focus();
    }
    
    @Listen("onOK = #txtReceta")
    public void onFocoRegistrar(Event event) {
        btnRegistrar3.focus();
    }
    
    
    @Listen("onClick = #btnRegistrar")
    public void onRegistrar3(Event event) {
        leer();
        grabar();
    }
         
         
    @Listen("onOK = #btnActualizar")
    public void onActualizarCombos(Event event) {
        modeloSublinea=new ListModelList(sublineaService.listaGeneral());
        cboSublinea.setModel(modeloSublinea);
        modeloFamilia=new ListModelList(familiaService.listaGeneral());
        cboFamilia.setModel(modeloFamilia);
        modeloPresentacion=new ListModelList(presentacionService.listaGeneral());
        cboPresentacion.setModel(modeloPresentacion);  
    }
    
           
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloSublinea=new ListModelList(sublineaService.listaGeneral());
        cboSublinea.setModel(modeloSublinea);
        modeloFamilia=new ListModelList(familiaService.listaGeneral());
        cboFamilia.setModel(modeloFamilia);
        modeloPresentacion=new ListModelList(presentacionService.listaGeneral());
        cboPresentacion.setModel(modeloPresentacion);    
        habilitar(false);
    }    
    
   public void leer() {     
       agregarConstraint();
        validarDatos();
        Sublinea sublinea=(Sublinea) modeloSublinea.getElementAt(cboSublinea.getSelectedIndex());
        Familia familia=(Familia) modeloFamilia.getElementAt(cboFamilia.getSelectedIndex());
        Presentacion presentacion=(Presentacion) modeloPresentacion.getElementAt(cboPresentacion.getSelectedIndex());
        producto.setCnomproducto(txtNomPro.getText().toUpperCase());
        producto.setIdsublinea(sublinea);
        producto.setIdfamilia(familia);
        producto.setIdpresentacion(presentacion);
        producto.setIdusuario(usuario);
        producto.setCcodigobarra(txtBarras.getText());
        producto.setCreseta(txtReceta.getText().toUpperCase());
        producto.setBinafecto(bInafecto.isChecked());
        producto.setBpsicotropico(bPsicotropico.isChecked());
        producto.setNmenudeo(nFraccion.getValue());
    }   
       
    public void grabar() {        
        producto=productoService.registrar(producto);
        winProducto.onClose();
        winProducto.setAttribute("REST",true);
        winProducto.setAttribute("PRODUCTO",producto);
    }

    public void habilitar(boolean enable) {
        txtNomPro.setReadonly(enable);
        txtBarras.setReadonly(enable);
        txtReceta.setReadonly(enable);
        bInafecto.setDisabled(enable);
        bPsicotropico.setDisabled(enable);
        cboFamilia.setDisabled(enable);
        cboPresentacion.setDisabled(enable);
        cboSublinea.setDisabled(enable);
        nFraccion.setReadonly(enable);
    }

    public void validarDatos() {
        
        txtNomPro.getValue();
        if(cboFamilia.getSelectedIndex()==-1){
            throw new ExceptionZarcillo("Debe Seleccionar familia...");
        }
        if(cboSublinea.getSelectedIndex()==-1){
            throw new ExceptionZarcillo("Debe Seleccionar Sublinea...");
        }
        if(cboPresentacion.getSelectedIndex()==-1){
            throw new ExceptionZarcillo("Debe Seleccionar Presentacion...");
        }
    }

    public void agregarConstraint() {
        txtNomPro.setConstraint(new ConstraintCamposObligatorios());        
    }

    public void quitarConstraint() {
        txtNomPro.setConstraint("");
    }   
}

