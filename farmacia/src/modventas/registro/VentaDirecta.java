package modventas.registro;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.ColaImpresionService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.CondicionVentaService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.TipoPagoService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.MenuImpresion;
import modmantenimiento.util.NumerosLetras;
import modventas.util.ConstraintMaximoStock;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.KeyEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class VentaDirecta extends SelectorComposer {

    private Usuario usuario;
    private RegistroSalida regsalida = new RegistroSalida();
    private ComprobanteEmitido comprobante = new ComprobanteEmitido();
    private ListModelList modeloAlmacen;
    private ListModelList modeloDetalle;
    private ListModelList modeloCondicion;
    private ListModelList modeloMotivo;
    private ListModelList modeloVendedor;
    private ListModelList modeloPago;
    private Periodo periodo;
    private Cliente cliente = new Cliente();
    @Wire
    private Window winVenta;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Combobox cboCondicion;
    @Wire
    private Combobox cboMotivo;
    @Wire
    private Combobox cboVendedor;
    @Wire
    private Combobox cboPago;
    @Wire
    private Datebox dFecha;
    @Wire
    private Button btnAgregar;
    @Wire
    private Toolbarbutton btnRegistrar;
    @Wire
    private Toolbarbutton btnIgnorar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nValven;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Decimalbox nRedondeo;
    @Wire
    private Textbox txtCliente;
    @Wire
    private Textbox txtDocumento;
    @Wire
    private Textbox txtDireccion;
    @Wire
    private Decimalbox nEfectivo;
    @Wire
    private Decimalbox nVuelto;
    @Wire
    private Toolbarbutton btnCrear;
    @Wire
    private Intbox nOperacion;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    AlmacenService almacenService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    CondicionVentaService condicionVentaService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    @WireVariable
    RegistroSalidaService registroSalidaService;
    @WireVariable
    TipoPagoService tipoPagoService;
    @WireVariable
    DocumentoService documentoService;
    @WireVariable
    ClienteService clienteService;
    @WireVariable
    ColaImpresionService colaImpresionService;
    private String user_login;
    final Execution exec = Executions.getCurrent();
    private MenuImpresion menuimpresion;

    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winVenta.getFellow("mimpresion");
        menuimpresion = (MenuImpresion) macro.getChildren().get(0);
        initComponets();
    }

    @Listen("onClick = #btnAgregar")
    public void onAgregarNuevo(Event event) {
        agregarDetalle();
    }
    
    @Listen("onCancel = #winVenta")
    public void onLimpiarVentana(Event event) {
        limpiar();
    }

    @Listen("onClick = #btnRegistrar")
    public void onRegistrar(Event event) throws JRException {
        registrar();
    }

    @Listen("onSelect= #cboCondicion")
    public void oncargarPlazo(Event event) {
        cargarPlazo();
        nPlazo.select();
    }

    @Listen("  onBlur = intbox#i0,intbox#i1 ")
    public void calcular() {
        cargarPie();
    }

    @Listen("onCtrlKey = #btnAgregar")
    public void onRecalcula(Event event) {
        if (((KeyEvent) event).getKeyCode() == 119) {
            nEfectivo.select();
        }
    }
    
    @Listen("onCtrlKey = #i0")
    public void onRecantidad(Event event) {
        if (((KeyEvent) event).getKeyCode() == 119) {
            nEfectivo.select();
        }
    }
    
    @Listen("onCtrlKey = #i1")
    public void onRemenudeo(Event event) {
        if (((KeyEvent) event).getKeyCode() == 119) {
            nEfectivo.select();
        }
    }

    @Listen("onCtrlKey = #nEfectivo")
    public void onGrabar(Event event) throws JRException {
        if (((KeyEvent) event).getKeyCode() == 119) {
            registrar();
        }
    }
    
    @Listen("  onOK = #nEfectivo")
    public void onGrabarEfectivo() throws JRException {
        registrar();
    }
    
    @Listen("  onBlur = #nEfectivo ")
    public void calcularVuelto() {
        nVuelto.setValue(nEfectivo.getValue().subtract(nImporte.getValue()));
    }
    
    

    @Listen("  onOK = intbox#i0 ")
    public void onFocoMenudeo(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda6 = (Listcell) item.getChildren().get(6);
        Intbox cantidad = (Intbox) celda6.getFirstChild();
        DetalleVenta detven =  (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstock()));
        sub.getValue();
        cantidad.focus();
        cantidad.select();
        cargarPie();
    }

    @Listen("  onOK = intbox#i1 ")
    public void onFocoAgregar(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        DetalleVenta detven =  (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstockfraccion()));
        sub.getValue();        
        cargarPie();
        btnAgregar.focus();
    }

    @Listen("onClick = #btnQuitar")
    public void onQuitarDetalle(Event event) {
        Toolbarbutton btn = (Toolbarbutton) event.getTarget();
        Listitem item = (Listitem) (btn.getParent().getParent());
        borrarProducto(item.getIndex());
    }

    @Listen("  onOK = textbox#txtDocumento ")
    public void busquedaCliente() {
        buscarCliente();
    }

    @Listen("onClick = #btnCrear")
    public void onCrearCliente(Event event) {
        crearCliente();
    }

    @Listen("onClick = #btnIgnorar")
    public void onLimpiar(Event event) {
        limpiar();
    }

    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
        imprimir();
    }

    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        modeloCondicion = new ListModelList(ventaService.listaCondicion());
        cboCondicion.setModel(modeloCondicion);
        if (modeloCondicion.size() > 0) {
            cboCondicion.onInitRender(new Event("", cboCondicion));
            cboCondicion.close();
            cboCondicion.setSelectedIndex(0);
            cargarPlazo();
        }
        modeloMotivo = new ListModelList(ventaService.listaMotivo());
        cboMotivo.setModel(modeloMotivo);
        if (modeloMotivo.size() > 0) {
            cboMotivo.onInitRender(new Event("", cboMotivo));
            cboMotivo.close();
            cboMotivo.setSelectedIndex(0);
        }
        modeloVendedor = new ListModelList(ventaService.listaVendedorPorIdusuario(usuario.getIdusuario()));
        cboVendedor.setModel(modeloVendedor);
        if (modeloVendedor.size() > 0) {
            cboVendedor.onInitRender(new Event("", cboVendedor));
            cboVendedor.close();
            cboVendedor.setSelectedIndex(0);
        }
        modeloPago = new ListModelList(tipoPagoService.listaTipoPagoCliente());
        cboPago.setModel(modeloPago);
        if (modeloPago.size() > 0) {
            cboPago.onInitRender(new Event("", cboPago));
            cboPago.close();
            cboPago.setSelectedIndex(0);
        }
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        periodo = periodoService.buscarPorDfecha(new Date());
        dFecha.setValue(new Date());
        btnAgregar.focus();
    }

    private void cargarPlazo() {
        CondicionVenta condicion = (CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        nPlazo.setValue(condicion.getNplazo());
    }

    private void borrarProducto(int index) {
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea eliminar registro?", "Venta", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            DetalleVenta detalle = (DetalleVenta) modeloDetalle.getElementAt(index);
            modeloDetalle.remove(detalle);
        }
        cargarPie();
    }

    private void agregarDetalle() {
        cboCondicion.setDisabled(true);
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        CondicionVenta condicion = (CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/ventas/util/agregardetalleventa.zul", null, null);
        winbuscaprod.setAttribute("ALMACEN", almacen);
        winbuscaprod.setAttribute("CONDICION", condicion);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            DetalleVenta detventa = (DetalleVenta) winbuscaprod.getAttribute("DETALLEVENTA");
            modeloDetalle.add(detventa);
            lstDetalle.onInitRender();
            focoCantidad();
            cargarPie();
        } else {
            btnRegistrar.focus();
        }
    }

    private void focoCantidad() {
        Listitem fila = lstDetalle.getItemAtIndex(modeloDetalle.getSize() - 1);
        Listcell celda5 = (Listcell) fila.getChildren().get(5);
        Intbox cantidad = (Intbox) celda5.getFirstChild();
        cantidad.focus();
        cantidad.select();
    }

    private void cargarPie() {
        BigDecimal nsubtot = new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleVenta detalleventa;
        for (Listitem item : ldatos) {
            detalleventa = (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
            if (detalleventa.getNcanart() > 0 && detalleventa.getNcanartm() > 0) {
                throw new ExceptionZarcillo("No se puede vender en unidades y menudeo...");
            }
            nsubtot = nsubtot.add(detalleventa.getNsubtot());
            nigv = nigv.add(detalleventa.getNigv());
            nprecio = nprecio.add(detalleventa.getNimporte());
        }

        regsalida.setMovimientoCollection(llenarDetalle());
        regsalida.calcula(periodo.getNigv());
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
        nEfectivo.setValue(nImporte.getValue());
         nVuelto.setValue(nEfectivo.getValue().subtract(nImporte.getValue()));
    }

    private List<Movimiento> llenarDetalle() {
        List<Movimiento> coldetalle = new ArrayList<Movimiento>();
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleVenta detalleventa;
        Movimiento movimiento;
        for (Listitem item : ldatos) {
            movimiento = new Movimiento();
            detalleventa = new DetalleVenta();
            detalleventa = (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
            if (!((detalleventa.getNcanart() == 0) && (detalleventa.getNcanartm() == 0))) {
                movimiento.setIdproducto(detalleventa.getExistencia().getIdproducto());
                movimiento.setIdalmacen(detalleventa.getExistencia().getIdalmacen());
                movimiento.setNcosuni(detalleventa.getNcosuni());
                movimiento.setNvaluni(detalleventa.getNvaluni());
                if (detalleventa.getNcanartm() > 0) {
                    movimiento.setNcosuni(detalleventa.getNcosunim());
                    movimiento.setNvaluni(detalleventa.getNvalunim());
                }
                movimiento.setNcantidad(detalleventa.getNcanart());
                movimiento.setNcantidadm(detalleventa.getNcanartm());
                movimiento.setNstock(detalleventa.getNstock());
                movimiento.setNstockm(detalleventa.getNstockm());
                movimiento.setNdesfin(detalleventa.getNdesfin());
                movimiento.setNdeslab(detalleventa.getNdeslab());
                movimiento.setNdesbon(detalleventa.getNdesbon());
                movimiento.setNsubtot(detalleventa.getNsubtot());
                movimiento.setBinafecto(detalleventa.isBinafec());
                coldetalle.add(movimiento);
            }
        }
        return coldetalle;
    }

    private void validar() {
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        cboAlmacen.getValue();
    }

    public void registrar() throws JRException {
        validar();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        CondicionVenta condicion = (CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        MotivoSalida motivo = (MotivoSalida) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        regsalida.setIdusuario(usuario);
        regsalida.setIdunidad(almacen.getIdunidad());
        regsalida.setIdcondicion(condicion);
        regsalida.setNplazo(nPlazo.getValue());
        regsalida.setIdmotivo(motivo);
        regsalida.setIdvendedor(vendedor);
        regsalida.setDfecha(dFecha.getValue());
        regsalida.setDfecdig(dFecha.getValue());
        regsalida.setMovimientoCollection(llenarDetalle());
        regsalida.setIddocumento(documentoService.buscarPorCcodigosunat(Documento.TICKET.getCcodigosunat()));
        int operacion = ventaService.registrar(regsalida, almacen);
        nOperacion.setValue(operacion);
        registrarDocumento();
    }

    public void registrarDocumento() throws JRException {
        TipoPago tpago = (TipoPago) modeloPago.getElementAt(cboPago.getSelectedIndex());
        regsalida.setDfecimp(dFecha.getValue());
        regsalida.setCnomcli(txtCliente.getText().toUpperCase());
        if (txtDocumento.getText().trim().length() == 8) {
            regsalida.setCdni(txtDocumento.getText());
        }

        if (cliente.getIdcliente() != null) {
            regsalida.setIdcliente(cliente);
        }
        comprobante = colaImpresionService.crearDocumento(regsalida, tpago, usuario);
        regsalida = comprobante.getIdregsalida();
        btnRegistrar.setDisabled(true);
        btnAgregar.setDisabled(true);
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea imprimir? " + comprobante.getIddocumento().getCabrev() + " " + comprobante.getCserie() + "-" + comprobante.getCnumero(), "REGISTRO SATISFACTORIO", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            imprimir();
        }
        btnIgnorar.focus();
    }

    private void buscarCliente() {
        if (isNumberFloat(txtDocumento.getText().trim())) {
            if (txtDocumento.getText().trim().length() == 11) {
                cliente = clienteService.buscarPorCruc(txtDocumento.getText());
                txtCliente.setText(cliente.getCnomcli());
                txtDireccion.setText(cliente.getCdircli());
                btnCrear.setDisabled(true);
            } else if (txtDocumento.getText().trim().length() == 8) {
                cliente = clienteService.buscarPorCdni(txtDocumento.getText());
                txtCliente.setText(cliente.getCnomcli());
                txtDireccion.setText(cliente.getCdircli());
                btnCrear.setDisabled(true);
            } else {
                throw new ExceptionZarcillo("RUC/DNI Incorrecto");
            }
        } else {
            throw new ExceptionZarcillo("RUC/DNI Incorrecto");
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

    private void crearCliente() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        cliente.setIdunidad(almacen.getIdunidad());
        cliente.setIdusuario(usuario);
        cliente.setCnomcli(txtCliente.getText().toUpperCase().trim());
        cliente.setCdircli(txtDireccion.getText().toUpperCase().trim());
        if (isNumberFloat(txtDocumento.getText().trim())) {
            if (txtDocumento.getText().trim().length() == 11) {
                cliente.setCruc(txtDocumento.getText());
            } else if (txtDocumento.getText().trim().length() == 8) {
                cliente.setCdni(txtDocumento.getText());
            } else {
                throw new ExceptionZarcillo("RUC/DNI Incorrecto");
            }
        } else {
            throw new ExceptionZarcillo("RUC/DNI Incorrecto");
        }
        cliente = clienteService.registrarClienteVenta(cliente);
        regsalida.setIdcliente(cliente);
        btnCrear.setDisabled(true);
        Messagebox.show("Registro Satisfactorio");
    }

    private void limpiar() {
        cliente = new Cliente();
        regsalida = new RegistroSalida();
        comprobante = new ComprobanteEmitido();
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        txtCliente.setText("");
        txtDireccion.setText("");
        txtDocumento.setText("");
        nOperacion.setValue(0);
        cargarPie();
        btnAgregar.setDisabled(false);
        btnRegistrar.setDisabled(false);
        btnAgregar.focus();
    }

    public void imprimir() throws JRException {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        TipoPago tpago = (TipoPago) modeloPago.getElementAt(cboPago.getSelectedIndex());
        String reporteFuente;
        DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
        simbolos.setDecimalSeparator('.');

        NumerosLetras numeroletras = new NumerosLetras();
        HashMap parametro = new HashMap();
        parametro.put("UNIDADNEGOCIO", regsalida.getIdunidad().getCnomunidad().trim());
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("DIREMPRESA", almacen.getIdunidad().getIdempresa().getCdireccion());
        parametro.put("UBIGEOEMPRESA", almacen.getIdunidad().getIdempresa().getIdubigeo().getCubigeo().trim() + " - " + almacen.getIdunidad().getIdempresa().getIdubigeo().getCnomprovincia().trim());
        parametro.put("RUCEMPRESA", "RUC: " + almacen.getIdunidad().getIdempresa().getCruc());

        if (regsalida.getIddocumento().getCcodigosunat().contains(Documento.FACTURA_SUNAT.getCcodigosunat())) {
            parametro.put("CLIENTE", cliente.getCnomcli());
            parametro.put("DIRECCION", cliente.getCdircli());
            parametro.put("RUC", cliente.getCruc());
            parametro.put("DNI", "");
        } else {
            parametro.put("CLIENTE", txtCliente.getText().toUpperCase());
            parametro.put("DIRECCION", txtDireccion.getText().toUpperCase());
            parametro.put("DNI", txtDocumento.getText().toUpperCase());
        }
        parametro.put("DISTRITO", regsalida.getIdcliente().getIdubigeo().getCubigeo().trim());
        parametro.put("PROVINCIA", regsalida.getIdcliente().getIdubigeo().getCnomprovincia().trim());
        parametro.put("DEPARTAMENTO", regsalida.getIdcliente().getIdubigeo().getCnomdepartamento().trim());
        parametro.put("FECHA", regsalida.getDfecha());
        parametro.put("VENCIMIENTO", comprobante.getDfecven());
        parametro.put("VENDEDOR", regsalida.getIdvendedor().getIdvendedor());
        parametro.put("CONDICION", regsalida.getIdcondicion().getCnomcondicion() + " PLAZO: " + regsalida.getNplazo());
        parametro.put("HORAIMP", regsalida.getDfecimp());
        parametro.put("OPERACION", regsalida.getIdregsalida());
        parametro.put("HORADIG", regsalida.getDfecreg());
        parametro.put("VALORVENTA", regsalida.getNafecto());
        parametro.put("IGV", regsalida.getNigv());
        parametro.put("IMPORTE", regsalida.getNimporte());
        parametro.put("EFECTIVO", nEfectivo.getValue());
        parametro.put("VUELTO", nEfectivo.getValue().subtract(regsalida.getNimporte()));
        parametro.put("SERIE", comprobante.getCserie());
        parametro.put("NUMERO", comprobante.getCnumero());
        parametro.put("GLOSA", regsalida.getCglosa());
        if (regsalida.getIdcondicion().getBcontado()) {
            parametro.put("TIPOPAGO", tpago.getCnomtipo());
        }
        //Probar
        parametro.put(JRParameter.REPORT_LOCALE,new Locale("es", "US"));
        parametro.put("USUARIO", "Caja: " + usuario.getCabrev() + " Vend.: " + regsalida.getIdvendedor().getCabrev());
        parametro.put("LETRAS", numeroletras.convertirLetras(regsalida.getNimporte()));

        if (regsalida.getIddocumento().getCcodigosunat().contains(Documento.TICKET.getCcodigosunat())) {
            reporteFuente = "/resources/ticket.jrxml";
        } else {
            if (regsalida.getIddocumento().getCcodigosunat().contains(Documento.BOLETA_SUNAT.getCcodigosunat())) {
                reporteFuente = "/resources/boleta.jrxml";
            } else {
                reporteFuente = "/resources/factura.jrxml";
            }
        }
        InputStream is = this.getClass().getClassLoader().getResourceAsStream(reporteFuente);
        JasperReport reportecompilado = JasperCompileManager.compileReport(is);
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        menuimpresion.dialogoImpresion(false);
        menuimpresion.imprimirReporte(reportecompilado, regsalida.hashCode(), parametro, data);
    }
}
