package modfinanzas.consulta;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.LetraProveedor;
import com.zarcillo.domain.NotaboProveedor;
import com.zarcillo.domain.NotcarProveedor;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.CuentaPagarService;
import com.zarcillo.service.NotaboProveedorService;
import com.zarcillo.service.NotcarProveedorService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.UnidadNegocioService;
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
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CtaCteProveedor extends SelectorComposer implements PeriodoListener {

    private Usuario usuario;
    private Proveedor proveedor = new Proveedor();
    private Periodo periodo;
    private ListModelList modeloFacturas;
    private ListModelList modeloLetras;
    private ListModelList modeloNotabo;
    private ListModelList modeloNotcar;
    private ListModelList modeloUnidad;
    private MenuPeriodo menuperiodo;
    private MenuResultado menuresultado;
    @Wire
    private Window winTarjeta;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Textbox txtNombre;
    @Wire
    private Textbox txtRuc;
    @Wire
    private Textbox txtDireccion;
    @Wire
    private Button btnCrear;
    @Wire
    private Tab tabFactura;
    @Wire
    private Tab tabLetra;
    @Wire
    private Tab tabNotabo;
    @Wire
    private Tab tabNotcar;
    @Wire
    private Listbox lstFactura;
    @Wire
    private Listbox lstLetra;
    @Wire
    private Listbox lstNotabo;
    @Wire
    private Listbox lstNotcar;
    @Wire
    private Checkbox bPendiente;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    CuentaPagarService cuentaPagarService;
    @WireVariable
    NotaboProveedorService notaboProveedorService;
    @WireVariable
    NotcarProveedorService notcarProveedorService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

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

    @Listen("onClick = #tabFactura ,#tabLetra , #tabNotabo , #tabNotcar ")
    public void onseleccionarLista(Event event) {
        habilitarPendientes();
    }

    @Listen("onCheck = #bPendiente")
    public void onHabilitar(Event event) {
        habilitarPendientes();
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

    @Listen("onOK = #lstFactura")
    public void onMostrarFacturas(Event event) {
        mostrarFacturas();
    }

    @Listen("onOK = #lstLetra")
    public void onMostrarLetras(Event event) {
        mostrarLetras();
    }

    @Listen("onOK = #lstNotabo")
    public void onMostrarNotabo(Event event) {
        mostrarNotabo();
    }

    @Listen("onOK = #lstNotcar")
    public void onMostrarNotcar(Event event) {
        mostrarNotcar();
    }

    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloFacturas = new ListModelList();
        lstFactura.setModel(modeloFacturas);
        modeloLetras = new ListModelList();
        lstLetra.setModel(modeloLetras);
        modeloNotabo = new ListModelList();
        lstNotabo.setModel(modeloNotabo);
        modeloNotcar = new ListModelList();
        lstNotcar.setModel(modeloNotcar);
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin()));
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
        menuresultado.setSize(modeloFacturas.getSize());
        buscarProveedor();
    }

    private void buscarProveedor() {
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
        txtDireccion.setText(proveedor.getCdireccion().trim() + " - " + proveedor.getIdubigeo().getCubigeo());
        btnCrear.setDisabled(false);
        cboUnidad.setDisabled(true);
        tabFactura.setSelected(true);
        btnCrear.focus();
        bPendiente.setChecked(true);
        menuperiodo.setLista(periodoService.listaPeriodoAños());
        periodo = periodoService.buscarPorDfecha(new Date());//
        menuperiodo.setPeriododefecto(periodo);
    }

    public void crear() {
        String action = (String) btnCrear.getAttribute("ACTION");
        if (action.equals("FA")) {
            crearFactura();
            return;
        }
        if (action.equals("LE")) {
            crearLetra();
            return;
        }
        if (action.equals("NC")) {
            crearNotaCredito();
            return;
        }
        if (action.equals("ND")) {
            crearNotaDebito();
            return;
        }
    }

    public void cargarFacturas() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nueva Factura");
        btnCrear.setAttribute("ACTION", "FA");
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloFacturas = new ListModelList(cuentaPagarService.listaPorIdunidadPorIdproveedorPorNano(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
        lstFactura.setModel(modeloFacturas);
        //mostrar resultado de la consulta
        menuresultado.setSize(modeloFacturas.getSize());
    }

    public void cargarLetras() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nueva Letra");
        btnCrear.setAttribute("ACTION", "LE");
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloLetras = new ListModelList(cuentaPagarService.listaPorIdunidadPorIdproveedorPorNano(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
        lstLetra.setModel(modeloLetras);
        //mostrar resultado de la consulta
        menuresultado.setSize(modeloLetras.getSize());
    }

    public void cargarNotaCredito() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nueva N/Credito");
        btnCrear.setAttribute("ACTION", "NC");
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloNotabo = new ListModelList(notaboProveedorService.listaPorIdunidadPorIdproveedorPorNano(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
        lstNotabo.setModel(modeloNotabo);
        //mostrar resultado de la consulta
        menuresultado.setSize(modeloNotabo.getSize());
    }

    public void cargarNotaDebito() {
        validar();
        btnCrear.setVisible(true);
        btnCrear.setLabel("Nueva N/Debito");
        btnCrear.setAttribute("ACTION", "ND");
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloNotcar = new ListModelList(notcarProveedorService.listaPorIdunidadPorIdproveedorPorNano(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
        lstNotcar.setModel(modeloNotcar);
        //mostrar resultado de la consulta
        menuresultado.setSize(modeloNotcar.getSize());
    }

    private void crearFactura() {
        Window wincrea = (Window) Executions.createComponents("/modulos/finanzas/registro/nuevafactura.zul", null, null);
        CuentaPagar cpagar = new CuentaPagar();
        cpagar.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        cpagar.setIdproveedor(proveedor);
        cpagar.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("CUENTAPAGAR", cpagar);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            cpagar = (CuentaPagar) wincrea.getAttribute("CUENTAPAGAR");
            modeloFacturas.add(0, cpagar);
        }
    }

    private void crearLetra() {
        Window wincrea = (Window) Executions.createComponents("/modulos/finanzas/registro/nuevaletra.zul", null, null);
        LetraProveedor letra = new LetraProveedor();
        letra.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        letra.setIdproveedor(proveedor);
        letra.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("LETRA", letra);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            letra = (LetraProveedor) wincrea.getAttribute("LETRA");
            modeloLetras.add(0, letra);
        }
    }

    private void crearNotaCredito() {
        Window wincrea = (Window) Executions.createComponents("/modulos/finanzas/registro/nuevanotacredito.zul", null, null);
        NotaboProveedor notabo = new NotaboProveedor();
        notabo.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        notabo.setIdproveedor(proveedor);
        notabo.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("NOTABO", notabo);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            notabo = (NotaboProveedor) wincrea.getAttribute("NOTABO");
            modeloNotabo.add(0, notabo);
        }
    }

    private void crearNotaDebito() {
        Window wincrea = (Window) Executions.createComponents("/modulos/finanzas/registro/nuevanotadebito.zul", null, null);
        NotcarProveedor notcar = new NotcarProveedor();
        notcar.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        notcar.setIdproveedor(proveedor);
        notcar.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("NOTCAR", notcar);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            notcar = (NotcarProveedor) wincrea.getAttribute("NOTCAR");
            modeloNotcar.add(0, notcar);
        }
    }

    public void limpiar() {
        cboUnidad.setDisabled(false);
        cboUnidad.focus();
        txtNombre.setText("");
        txtDireccion.setText("");
        txtRuc.setText("");

        modeloFacturas = new ListModelList();
        lstFactura.setModel(modeloFacturas);
        modeloLetras = new ListModelList();
        lstLetra.setModel(modeloLetras);
        modeloNotabo = new ListModelList();
        lstNotabo.setModel(modeloNotabo);
        modeloNotcar = new ListModelList();
        lstNotcar.setModel(modeloNotcar);
        tabFactura.setSelected(true);

        //mostrar resultado de la consulta
        menuresultado.setSize(0);
    }

    @Override
    public void escribir(Periodo periodo) {
        this.periodo = periodo;
        habilitarPendientes();
    }

    @Override
    public void validar() {
        cboUnidad.getValue();
    }

    public void mostrarFacturas() {
        Window win = (Window) Executions.createComponents("/modulos/finanzas/consulta/detallefactura.zul", null, null);
        win.setClosable(true);
        CuentaPagar factura = (CuentaPagar) modeloFacturas.getElementAt(lstFactura.getSelectedIndex());
        win.setAttribute("CUENTAPAGAR", factura);
        win.doModal();
    }

    public void mostrarLetras() {
        Window win = (Window) Executions.createComponents("/modulos/finanzas/consulta/detalleletra.zul", null, null);
        win.setClosable(true);
        LetraProveedor letra = (LetraProveedor) modeloLetras.getElementAt(lstLetra.getSelectedIndex());
        win.setAttribute("LETRA", letra);
        win.doModal();
    }

    public void mostrarNotabo() {
        Window win = (Window) Executions.createComponents("/modulos/finanzas/consulta/detallenotacredito.zul", null, null);
        win.setClosable(true);
        NotaboProveedor notabo = (NotaboProveedor) modeloNotabo.getElementAt(lstNotabo.getSelectedIndex());
        win.setAttribute("NOTABO", notabo);
        win.doModal();
    }

    public void mostrarNotcar() {
        Window win = (Window) Executions.createComponents("/modulos/finanzas/consulta/detallenotadebito.zul", null, null);
        win.setClosable(true);
        NotcarProveedor notcar = (NotcarProveedor) modeloNotcar.getElementAt(lstNotcar.getSelectedIndex());
        win.setAttribute("NOTCAR", notcar);
        win.doModal();
    }

    public void habilitarPendientes() {
        validar();
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        if (bPendiente.isChecked()) {
            if (tabFactura.isSelected()) {
                modeloFacturas = new ListModelList(cuentaPagarService.listaPorIdunidadPorIdproveedorPorNanoPendientes(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
                lstFactura.setModel(modeloFacturas);
                btnCrear.setVisible(true);
                btnCrear.setLabel("Crear Factura");
                btnCrear.setAttribute("ACTION", "FA");
                menuresultado.setSize(modeloFacturas.getSize());
            }
            if (tabLetra.isSelected()) {
                modeloLetras = new ListModelList();
                lstLetra.setModel(modeloLetras);
                btnCrear.setVisible(false);
                menuresultado.setSize(modeloLetras.getSize());
            }
            if (tabNotabo.isSelected()) {
                modeloNotabo = new ListModelList(notaboProveedorService.listaPorIdunidadPorIdproveedorPorNanoPendientes(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
                lstNotabo.setModel(modeloNotabo);
                btnCrear.setVisible(true);
                btnCrear.setLabel("Crear N/Credito");
                btnCrear.setAttribute("ACTION", "NC");
                menuresultado.setSize(modeloNotabo.getSize());

            }
            if (tabNotcar.isSelected()) {
                modeloNotcar = new ListModelList(notcarProveedorService.listaPorIdunidadPorIdproveedorPorNanoPendientes(unidad.getIdunidad(), proveedor.getIdproveedor(), periodo.getNano()));
                lstNotcar.setModel(modeloNotcar);
                btnCrear.setVisible(true);
                btnCrear.setLabel("Crear N/Debito");
                btnCrear.setAttribute("ACTION", "ND");
                menuresultado.setSize(modeloNotcar.getSize());

            }

        } else {
            if (tabFactura.isSelected()) {
                cargarFacturas();
            }
            if (tabLetra.isSelected()) {
                cargarLetras();
            }
            if (tabNotabo.isSelected()) {
                cargarNotaCredito();
            }
            if (tabNotcar.isSelected()) {
                cargarNotaDebito();
            }
        }
    }
}
