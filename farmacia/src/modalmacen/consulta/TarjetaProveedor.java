
package modalmacen.consulta;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.UsuarioService;
import java.util.Date;
import javax.naming.NamingException;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.MenuResultado;
import modmantenimiento.util.PeriodoListener;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;


@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class TarjetaProveedor extends SelectorComposer implements PeriodoListener {
    private Usuario usuario;
    private Proveedor proveedor=new Proveedor();
   
    private Periodo periodo;
    
    private ListModelList modeloIngresos;
    private ListModelList modeloCanjes;
    private ListModelList modeloAlmacen;
    
  
     private MenuPeriodo menuperiodo;
  
    private MenuResultado menuresultado;
    
    
    @Wire
    private Window winTarjeta;
    
    @Wire
    private Combobox cboAlmacen;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtRuc;
    
    @Wire
    private Textbox txtDireccion;
    
    @Wire
    private Button btnCrear;
    
    @Wire
    private Tab tabIngresos;
    
    @Wire
    private Tab tabCanjes;
    
    @Wire
    private Listbox lstIngresos;
    
    @Wire
    private Listbox lstCanjes;
    
    
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    PeriodoService periodoService;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    RegistroEntradaService registroEntradaService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    @Listen("onCreate=window#winTarjeta")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winTarjeta.getFellow("mperiodo");
        menuperiodo = (MenuPeriodo) macro.getChildren().get(0);
        menuperiodo.setPeriodolistener(this);

        HtmlMacroComponent macro2 = (HtmlMacroComponent) winTarjeta.getFellow("mresultado");
        menuresultado = (MenuResultado) macro2.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onClick = #btnCrear")
    public void onCrearEntrada(Event event) {
        crear();
    }
    
    @Listen("onClick = #btnBuscar")
    public void onBuscarProveedor(Event event) {
        buscarProveedor();
    }
    
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winTarjeta.onClose();
    }
    
    @Listen("onCancel = #winTarjeta")
    public void onCancelarTarjeta(Event event) {
        limpiar();
    }
    
    @Listen("onOK = #cboAlmacen")
    public void onBusquedaProveedor(Event event) {
        buscarProveedor();
    }
    @Listen("onClick = #cboAlmacen")
    public void onBusquedaProveedorClick(Event event) {
        buscarProveedor();
    }
    @Listen("onOK = #lstIngresos")
    public void onMostrarIngresos(Event event) {
        mostrarIngresos();
    }
    @Listen("onOK = #lstCanjes")
    public void onMostrarCanjes(Event event) {
        mostrarCanjes();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);
        modeloIngresos=new ListModelList();
        lstIngresos.setModel(modeloIngresos);
        modeloCanjes=new ListModelList();
        lstCanjes.setModel(modeloCanjes);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        menuresultado.setSize(modeloIngresos.getSize());
        buscarProveedor();
    }
    
    private void buscarProveedor(){
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproveedor.zul", winTarjeta, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstProveedor");
            ListModel modelobuscado = lstproducto1.getModel();
            proveedor = (Proveedor) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            mostrarProveedor();
        }
    }
    private void mostrarProveedor() {
       txtNombre.setText(proveedor.getCnomprovee());
       txtRuc.setText(proveedor.getCruc());
       txtDireccion.setText(proveedor.getCdireccion().trim()+" - "+proveedor.getIdubigeo().getCubigeo());
       btnCrear.setDisabled(false);
       cboAlmacen.setDisabled(true);
        tabIngresos.setSelected(true);
        btnCrear.focus();
        menuperiodo.setLista(periodoService.listaPeriodoAños());
        periodo = periodoService.buscarPorDfecha(new Date());//
        menuperiodo.setPeriododefecto(periodo);
    }
    public void crear(){
        String action = (String) btnCrear.getAttribute("ACTION");
        if (action.equals("OC")) {
            crearIngreso();
            return;
        }
        if (action.equals("CJ")) {
            crearCanje();
            return;
        }
    }
    
    public void cargarIngresos() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nuevo Ingreso");
        btnCrear.setAttribute("ACTION", "OC");
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloIngresos = new ListModelList(registroEntradaService.listaPorIdalmacenPorIdproveedorPorNano(almacen.getIdalmacen(), proveedor.getIdproveedor(),periodo.getNano()));
        lstIngresos.setModel(modeloIngresos);
        

        //mostrar resultado de la consulta
        menuresultado.setSize(modeloIngresos.getSize());
    }
    
    public void cargarCanjes() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nuevo Canje");
        btnCrear.setAttribute("ACTION", "CJ");
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloCanjes = new ListModelList(registroEntradaService.listaPorIdalmacenPorIdproveedorPorNano(almacen.getIdalmacen(), proveedor.getIdproveedor(),periodo.getNano()));
        lstCanjes.setModel(modeloCanjes);

        //mostrar resultado de la consulta
        menuresultado.setSize(modeloCanjes.getSize());
    }
    
    private void crearIngreso() {
        Window wincrea = (Window) Executions.createComponents("/modulos/almacen/registro/nuevoingreso.zul", null, null);
        RegistroEntrada rentrada = new RegistroEntrada();
        rentrada.setIdalmacen((Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex()));
        rentrada.setIdproveedor(proveedor);
        rentrada.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("RENTRADA", rentrada);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            rentrada = (RegistroEntrada) wincrea.getAttribute("RENTRADA");
            modeloIngresos.add(0, rentrada);
        }
    }
    
    private void crearCanje() {
        Window wincrea = (Window) Executions.createComponents("/modulos/modalmacen/registro/nuevoingreso.zul", null, null);
        RegistroEntrada rentrada = new RegistroEntrada();
        rentrada.setIdalmacen((Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex()));
        rentrada.setIdproveedor(proveedor);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("RENTRADA", rentrada);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            rentrada = (RegistroEntrada) wincrea.getAttribute("RENTRADA");
            modeloIngresos.add(0, rentrada);
        }
    }
    public void limpiar() {
        cboAlmacen.setDisabled(false);
        cboAlmacen.focus();
        txtNombre.setText("");
        txtDireccion.setText("");
        txtRuc.setText("");
        
        modeloIngresos=new ListModelList();
        lstIngresos.setModel(modeloIngresos);
        modeloCanjes=new ListModelList();
        lstCanjes.setModel(modeloCanjes);
        tabIngresos.setSelected(true);

        //mostrar resultado de la consulta
        menuresultado.setSize(0);
    }
    
    @Override
    public void escribir(Periodo periodo) {
        this.periodo =periodo;
        if(tabIngresos.isSelected()){
            cargarIngresos();
        }
        if(tabCanjes.isSelected()){
            cargarCanjes();
        }
    }

    @Override
    public void validar() {
        cboAlmacen.getValue();
    }
    
    public void mostrarIngresos() {
        Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detalleingreso.zul", null, null);
        win.setClosable(true);
        RegistroEntrada ingreso = (RegistroEntrada) modeloIngresos.getElementAt(lstIngresos.getSelectedIndex());
        win.setAttribute("INGRESO", ingreso);
        win.doModal();
    }

    public void mostrarCanjes() {
        Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detallecanje.zul", null, null);
        win.setClosable(true);
        RegistroEntrada canje = (RegistroEntrada) modeloIngresos.getElementAt(lstIngresos.getSelectedIndex());
        win.setAttribute("CANJE", canje);
        win.doModal();
    }
}