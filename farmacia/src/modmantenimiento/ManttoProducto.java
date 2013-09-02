package modmantenimiento;

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
public class ManttoProducto extends SelectorComposer implements CrudListener{
    
    private Producto producto=new Producto();
    private Usuario usuario;    
    private MenuMantenimiento menuMantto;   
    
    private ListModelList modeloSublinea;
    private ListModelList modeloFamilia;
    private ListModelList modeloPresentacion;
    
    @Wire
    private Window winProducto;
    
    @Wire    
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtCodigo;
    
    @Wire
    private Intbox nFraccion;
    
    @Wire
    private Textbox txtBarras;
    @Wire
    private Intbox txtDigemid;
    
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
    private Checkbox bDigemid;
    
    @Wire
    private Textbox txtReceta;
        
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
        HtmlMacroComponent macro = (HtmlMacroComponent) winProducto.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtCodigo")
    public void onFocoNombre(Event event) {
        buscarProducto();
    }
    
         
    @Listen("onOK = #txtNombre")
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
    public void onBuscaBarra(Event event) {
        buscarCodigoBarras();
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
        habilitar(true);
    }    
    
    public void buscarProducto() {        
        if (txtCodigo.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproducto.zul", null, null);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstProducto");
                    ListModel modelobuscado = lstproducto1.getModel();
                    producto = (Producto) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());

                    escribir();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            producto = productoService.buscar(txtCodigo.getValue());
            escribir();
        }
    }     
    
    public void buscarCodigoBarras(){
        producto = productoService.busquedaPorCcodigobarra(txtBarras.getValue());
        escribir();
    }

    @Override
    public void leer() {     
        Sublinea sublinea=(Sublinea) modeloSublinea.getElementAt(cboSublinea.getSelectedIndex());
        Familia familia=(Familia) modeloFamilia.getElementAt(cboFamilia.getSelectedIndex());
        Presentacion presentacion=(Presentacion) modeloPresentacion.getElementAt(cboPresentacion.getSelectedIndex());
        producto.setIdproducto(txtCodigo.getText());
        producto.setCnomproducto(txtNombre.getText().toUpperCase());
        producto.setIdsublinea(sublinea);
        producto.setIdfamilia(familia);
        producto.setIdpresentacion(presentacion);
        producto.setIdusuario(usuario);
        producto.setCcodigobarra(txtBarras.getText());
        producto.setCcodigodiremid(txtDigemid.getValue());
        producto.setCreseta(txtReceta.getText().toUpperCase());
        producto.setBinafecto(bInafecto.isChecked());
        producto.setBpsicotropico(bPsicotropico.isChecked());
        producto.setBdiremid(bDigemid.isChecked());
        producto.setNmenudeo(nFraccion.getValue());
    }
    
    @Override
    public void escribir() {
        if (producto.getIdproducto() == null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtCodigo.setText(producto.getIdproducto());
        txtNombre.setText(producto.getCnomproducto());
        cboSublinea.setSelectedIndex(modeloSublinea.indexOf(producto.getIdsublinea()));
        cboFamilia.setSelectedIndex(modeloFamilia.indexOf(producto.getIdfamilia()));
        cboPresentacion.setSelectedIndex(modeloPresentacion.indexOf(producto.getIdpresentacion()));
        txtBarras.setText(producto.getCcodigobarra());        
        bInafecto.setChecked(producto.getBinafecto());
        bPsicotropico.setChecked(producto.getBpsicotropico());
        bDigemid.setChecked(producto.getBdiremid());                
        nFraccion.setValue(producto.getNmenudeo());     
        txtDigemid.setValue(producto.getCcodigodiremid());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        producto=new Producto();
        txtCodigo.setReadonly(true);
        txtCodigo.setText("");
        txtNombre.setText("");
        txtBarras.setText("");
        txtReceta.setText("");
        cboSublinea.setSelectedIndex(-1);
        cboSublinea.setText("");
        cboFamilia.setSelectedIndex(-1);
        cboFamilia.setText("");
        cboPresentacion.setSelectedIndex(-1);
        cboPresentacion.setText("");
        txtDigemid.setText("");
        bPsicotropico.setChecked(false);
        bInafecto.setChecked(false);
        bDigemid.setChecked(false);
        nFraccion.setValue(1);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        limpiar();
        txtCodigo.setReadonly(false);
        txtBarras.setReadonly(false);
        txtCodigo.focus();
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (producto.getIdproducto() == null) {
            throw new ExceptionZarcillo("Debe Buscar Producto...");
        }
    }

    @Override
    public void grabar() {        
        productoService.registrar(producto);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        productoService.actualizar(producto);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (producto.getIdproducto() == null) {
            throw new ExceptionZarcillo("Debe Buscar Producto...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            productoService.eliminar(producto);
            producto = new Producto();
            Messagebox.show("El Producto Fue Eliminado", "Producto", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        txtBarras.setReadonly(enable);
        txtReceta.setReadonly(enable);
        bInafecto.setDisabled(enable);
        bPsicotropico.setDisabled(enable);
        bDigemid.setDisabled(enable);
        cboFamilia.setDisabled(enable);
        cboPresentacion.setDisabled(enable);
        cboSublinea.setDisabled(enable);
        nFraccion.setReadonly(enable);
        txtDigemid.setReadonly(enable);
    }

    @Override
    public void validarDatos() {
        cboFamilia.getValue();
        cboPresentacion.getValue();
        cboSublinea.getValue();
        txtNombre.getValue();
        txtCodigo.getValue();
    }

    @Override
    public void salir() {
        winProducto.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
        cboPresentacion.setConstraint(new ConstraintCamposObligatorios());
        cboSublinea.setConstraint(new ConstraintCamposObligatorios());
        cboFamilia.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
        cboFamilia.setConstraint("");
        cboPresentacion.setConstraint("");
        cboSublinea.setConstraint("");
    }   
}

