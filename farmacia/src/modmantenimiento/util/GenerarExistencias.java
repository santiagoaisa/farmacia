package modmantenimiento.util;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.LoteService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.UsuarioService;
import java.text.DecimalFormat;
import javax.naming.NamingException;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class GenerarExistencias extends SelectorComposer{
    
    private Producto producto=new Producto();
    private Usuario usuario;   
    private ListModelList modeloAlmacen;
    
    @Wire
    private Textbox txtCodigo;
    
    @Wire
    private Textbox txtNombre;    
    
    @Wire
    private Combobox cboAlmacen;
        
    @Wire
    private Window winGenera;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    ProductoService productoService;
    
    @WireVariable
    ExistenciaService existenciaService;
    
    @WireVariable
    AlmacenService almacenService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winGenera")
    public void onCreate() throws NamingException {        
         initComponets();
     }
    
    @Listen("onClick = #btnRegistrar")
    public void onRegistrar(Event event) {
        registrar();
    } 
    
    @Listen("onOK = #txtCodigo")
    public void onFocoNombre(Event event) {
        buscarProducto();
    }
     
    
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloAlmacen=new ListModelList(almacenService.listaGeneral());
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        txtCodigo.focus();
    }    
    
    public void buscarProducto(){
        if (txtCodigo.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproducto.zul", null, null);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();

                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");

                if (rest) {
                    Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstproducto");
                    ListModel modelobuscado = lstproducto1.getModel();
                    producto = (Producto) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
                    llenarProducto();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            producto = productoService.buscar(txtCodigo.getValue());
            llenarProducto();
        }
    }
    
    private void llenarProducto(){
        txtCodigo.setValue(producto.getIdproducto());
        txtNombre.setValue(producto.getCnomproducto());
    }
    
   
    
    public void registrar(){
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        existenciaService.registrar(almacen, producto); 
        Messagebox.show("Existencia generada");
        producto=new Producto();
        txtCodigo.setText("");
        txtNombre.setText("");
    } 
    public void salir(){
        winGenera.onClose();
    }
}

