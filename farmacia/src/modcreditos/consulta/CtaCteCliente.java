package modcreditos.consulta;

import com.zarcillo.domain.NotaboCliente;
import com.zarcillo.domain.NotcarCliente;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.NotaboClienteService;
import com.zarcillo.service.NotcarClienteService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.util.Date;
import javax.naming.NamingException;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.MenuResultado;
import modmantenimiento.util.PeriodoListener;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
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
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CtaCteCliente extends SelectorComposer implements PeriodoListener {

    private Usuario usuario;
    private Cliente cliente = new Cliente();
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
    private Textbox txtDocumento;
    @Wire
    private Textbox txtDireccion;
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
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    ClienteService clienteService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    @WireVariable
    NotaboClienteService notaboClienteService;
    @WireVariable
    NotcarClienteService notcarClienteService;
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

    @Listen("onClick = #tabFactura ,#tabLetra , #tabNotabo , #tabNotcar ")
    public void onseleccionarLista(Event event) {
        habilitarPendientes();
    }

    @Listen("  onOK = #txtDocumento ")
    public void busquedaCliente() {
        buscarCliente();
    }

    @Listen("onClick = #btnBuscar")
    public void onBuscarCliente(Event event) {
        buscarCliente();
    }

    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winTarjeta.onClose();
    }

    @Listen("onCancel = #winTarjeta")
    public void onCancelarTarjeta(Event event) {
        limpiar();
    }

    @Listen("onOK = #lstFactura")
    public void onMostrarFacturas(Event event) {
        mostrarFacturas();
    }

    @Listen("onOK = #lstNotabo")
    public void onMostrarNotabo(Event event) {
        mostrarNotabo();
    }

    @Listen("onOK = #lstNotcar")
    public void onMostrarNotcar(Event event) {
        mostrarNotcar();
    }
    
    @Listen("onClick = #btnDetalle")
    public void onQuitarDetalle(Event event) {
        Toolbarbutton btn = (Toolbarbutton) event.getTarget();
        Listitem item = (Listitem) (btn.getParent().getParent());
        mostrarDetalle(item.getIndex());
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) {
        exportar();
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
    }

    public void buscarCliente() {
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        if (txtDocumento.getText().isEmpty()) {
            Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedacliente.zul", null, null);
            winbuscaprod.setAttribute("UNIDAD", unidad);
            winbuscaprod.setAttribute("REST", true);
            winbuscaprod.doModal();
            Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
            if (rest) {
                Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstCliente");
                ListModel modelobuscado = lstproducto1.getModel();
                cliente = (Cliente) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
                mostrarCliente();
            }
        } else {
            if (isNumberFloat(txtDocumento.getText().trim())) {
                if (txtDocumento.getText().trim().length() == 11) {
                    cliente = clienteService.buscarPorCruc(txtDocumento.getText());
                    mostrarCliente();
                } else if (txtDocumento.getText().trim().length() == 8) {
                    cliente = clienteService.buscarPorCdni(txtDocumento.getText());
                    mostrarCliente();
                } else {
                    throw new ExceptionZarcillo("RUC/DNI Incorrecto");
                }
            } else {
                throw new ExceptionZarcillo("RUC/DNI Incorrecto");
            }
        }

    }

    private void mostrarCliente() {
        txtNombre.setText(cliente.getCnomcli());        
        if (cliente.getCruc().trim().isEmpty()) {
            txtDocumento.setText(cliente.getCdni());
        }
        else{
            txtDocumento.setText(cliente.getCruc());
        }
        txtDireccion.setText(cliente.getCdircli().trim() + " - " + cliente.getIdubigeo().getCubigeo());
        cboUnidad.setDisabled(true);
        txtDocumento.setReadonly(true);
        tabFactura.setSelected(true);
        menuperiodo.setLista(periodoService.listaPeriodoAños());
        periodo = periodoService.buscarPorDfecha(new Date());
        menuperiodo.setPeriododefecto(periodo);
    }
    
    private void mostrarDetalle(int index){
        ComprobanteEmitido comprobante=(ComprobanteEmitido) modeloFacturas.getElementAt(index);
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/detallemovimientos.zul", null, null);
        wincrea.setAttribute("COMPROBANTE", comprobante);
        wincrea.setAttribute("UNIDAD", unidad);
        wincrea.setAttribute("USUARIO", usuario);
        wincrea.doModal();
    }

    public void cargarFacturas() {
        validar();
        UnidadNegocio unidad = (UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloFacturas = new ListModelList(comprobanteEmitidoService.listaPorIdunidadPorIdclientePorNano(unidad.getIdunidad(), cliente.getIdcliente(), periodo.getNano()));
        lstFactura.setModel(modeloFacturas);
        //mostrar resultado de la consulta
        menuresultado.setSize(modeloFacturas.getSize());
    }

    public void cargarLetras() {
        validar();

        menuresultado.setSize(modeloLetras.getSize());
    }

    public void cargarNotaCredito() {
        validar();

        menuresultado.setSize(modeloNotabo.getSize());
    }

    public void cargarNotaDebito() {
        validar();

        menuresultado.setSize(modeloNotcar.getSize());
    }

    private void crearNotaCredito() {
        Window wincrea = (Window) Executions.createComponents("/modulos/creditos/registro/nuevanotacredito.zul", null, null);
        NotaboCliente notabo = new NotaboCliente();
        notabo.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        notabo.setIdcliente(cliente);
        notabo.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("NOTABO", notabo);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            notabo = (NotaboCliente) wincrea.getAttribute("NOTABO");
            modeloNotabo.add(0, notabo);
        }
    }

    private void crearNotaDebito() {
        Window wincrea = (Window) Executions.createComponents("/modulos/creditos/registro/nuevanotadebito.zul", null, null);
        NotcarCliente notcar = new NotcarCliente();
        notcar.setIdunidad((UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex()));
        notcar.setIdcliente(cliente);
        notcar.setIdusuario(usuario);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("NOTCAR", notcar);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            notcar = (NotcarCliente) wincrea.getAttribute("NOTCAR");
            modeloNotcar.add(0, notcar);
        }
    }

    public void limpiar() {
        cboUnidad.setDisabled(false);
        txtDocumento.setReadonly(false);
        txtDocumento.setText("");
        txtDocumento.focus();
        txtNombre.setText("");
        txtDireccion.setText("");
        

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
        cargarFacturas();
    }

    @Override
    public void validar() {
        cboUnidad.getValue();
    }

    public void mostrarFacturas() {
        Window win = (Window) Executions.createComponents("/modulos/creditos/consulta/amortizacioncomprobante.zul", null, null);
        win.setClosable(true);
        ComprobanteEmitido comprobante =  (ComprobanteEmitido) modeloFacturas.getElementAt(lstFactura.getSelectedIndex());
        win.setAttribute("COMPROBANTE", comprobante);
        win.setAttribute("USUARIO", usuario);
        win.doModal();
    }

    public void mostrarNotabo() {
        Window win = (Window) Executions.createComponents("/modulos/creditos/consulta/detallenotacredito.zul", null, null);
        win.setClosable(true);
        NotaboCliente notabo = (NotaboCliente) modeloNotabo.getElementAt(lstNotabo.getSelectedIndex());
        win.setAttribute("NOTABO", notabo);
        win.doModal();
    }

    public void mostrarNotcar() {
        Window win = (Window) Executions.createComponents("/modulos/creditos/consulta/detallenotadebito.zul", null, null);
        win.setClosable(true);
        NotcarCliente notcar = (NotcarCliente) modeloNotcar.getElementAt(lstNotcar.getSelectedIndex());
        win.setAttribute("NOTCAR", notcar);
        win.doModal();
    }

    public static boolean isNumberFloat(String cadena) {
        try {
            Float.parseFloat(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    public void habilitarPendientes() {
        validar();
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
    public void exportar(){           
        if(tabFactura.isSelected()){
            ExportarHojaCalculo.exportListboxToExcel(lstFactura, "FACTURAS");    
        }
        if(tabLetra.isSelected()){
            ExportarHojaCalculo.exportListboxToExcel(lstLetra, "LETRAS");                
        }
        if(tabNotabo.isSelected()){
            ExportarHojaCalculo.exportListboxToExcel(lstNotabo, "NOTABO");                
        }
        if(tabNotcar.isSelected()){
            ExportarHojaCalculo.exportListboxToExcel(lstNotcar, "NOTCAR");                
        }   
                 
    }  
}
