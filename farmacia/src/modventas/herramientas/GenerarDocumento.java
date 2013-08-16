package modventas.herramientas;

import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.ColaImpresionService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.TipoPagoService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.InputStream;
import java.text.DecimalFormatSymbols;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;
import static modmantenimiento.ManttoProveedor.isNumberFloat;
import modmantenimiento.util.MenuImpresion;
import modmantenimiento.util.NumerosLetras;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
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
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class GenerarDocumento extends SelectorComposer{
    
    private Usuario usuario;   
    private RegistroSalida regsalida=new RegistroSalida();
    private ListModelList modeloDetalle;
    private ListModelList modeloUnidad;
    private ListModelList modeloPago;
    private ComprobanteEmitido comprobante;
    private Cliente cliente=new Cliente();
    
    @Wire
    private Window winVenta;
    
    @Wire
    private Combobox cboUnidad;
    
    @Wire
    private Combobox cboPago;
    
    @Wire
    private Datebox dFecha;
    
    @Wire
    private Intbox nOperacion;
        
    @Wire
    private Listbox lstDetalle;
    
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
    private Toolbarbutton btnCrear;
    
    @Wire
    private Toolbarbutton btnGrabar;
    
    @Wire
    private Toolbarbutton btnImprimir;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    VentaService ventaService;
    
    @WireVariable
    ColaImpresionService colaImpresionService;
    
    @WireVariable
    TipoPagoService tipoPagoService;
    
    @WireVariable
    ClienteService clienteService;
    
    @WireVariable
    PeriodoService periodoService;
    
    @WireVariable
    RegistroSalidaService registroSalidaService;
    
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();   
    
    private MenuImpresion menuimpresion;
    
    
    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {   
        HtmlMacroComponent macro = (HtmlMacroComponent) winVenta.getFellow("mimpresion");
        menuimpresion = (MenuImpresion) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("  onOK = intbox#nOperacion ")
    public void buscarRegsalida() {
        buscar(nOperacion.getValue());
    }
    
    @Listen("  onOK = textbox#txtDocumento ")
    public void busquedaCliente() {
        buscarCliente();
    }
     
     @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
         imprimir();
    }
    
    @Listen("onClick = #btnGrabar")
    public void onRegistrar(Event event) throws JRException {
        registrar();
    } 
    
    @Listen("onClick = #btnCrear")
    public void onCrearCliente(Event event) {
        crearCliente();
    } 
    
    @Listen("onClick = #btnIgnorar")
    public void onLimpiar(Event event) {
        limpiar();
    } 
        
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);  
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin())); 
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
        modeloPago=new ListModelList(tipoPagoService.listaTipoPagoCliente());
        cboPago.setModel(modeloPago);
        if (modeloPago.size() > 0) {
            cboPago.onInitRender(new Event("", cboPago));
            cboPago.close();
            cboPago.setSelectedIndex(0);
        }
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecha.setValue(new Date());
        btnGrabar.setDisabled(true);
        btnImprimir.setDisabled(true);
        nOperacion.focus();
    } 
    
    private void buscarCliente(){
        if(isNumberFloat(txtDocumento.getText().trim())){
            if(txtDocumento.getText().trim().length()==11){
                cliente=clienteService.buscarPorCruc(txtDocumento.getText());
                txtCliente.setText(cliente.getCnomcli());
                txtDireccion.setText(cliente.getCdircli());
                btnCrear.setDisabled(true);
            }
            else if(txtDocumento.getText().trim().length()==8){
                cliente=clienteService.buscarPorCdni(txtDocumento.getText());
                txtCliente.setText(cliente.getCnomcli());
                txtDireccion.setText(cliente.getCdircli());
                btnCrear.setDisabled(true);
            }
            else{
                throw new ExceptionZarcillo("RUC/DNI Incorrecto");
            }
        }
        else{
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
    
    private void crearCliente(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        cliente.setIdunidad(unidad);
        cliente.setIdusuario(usuario);
        cliente.setCnomcli(txtCliente.getText().toUpperCase().trim());
        cliente.setCdircli(txtDireccion.getText().toUpperCase().trim());
        if(isNumberFloat(txtDocumento.getText().trim())){
            if(txtDocumento.getText().trim().length()==11){
                cliente.setCruc(txtDocumento.getText());
            }
            else if(txtDocumento.getText().trim().length()==8){
                cliente.setCdni(txtDocumento.getText());
            }
            else{
                throw new ExceptionZarcillo("RUC/DNI Incorrecto");
            }
        }
        else{
            throw new ExceptionZarcillo("RUC/DNI Incorrecto");
        }
        cliente=clienteService.registrarClienteVenta(cliente);
        regsalida.setIdcliente(cliente);
        btnCrear.setDisabled(true);
        Messagebox.show("Registro Satisfactorio");
    }
   
    private void buscar(int operacion){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), operacion);
        modeloDetalle=new ListModelList(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        if(regsalida.getBimpreso()){
            comprobante=comprobanteEmitidoService.buscarPorIdregsalida(regsalida.getIdregsalida());
            btnGrabar.setDisabled(true);
            btnImprimir.setDisabled(false);
        }
        else{
            btnGrabar.setDisabled(false);
        }
        
        cargarPie();
    }
    public void limpiar(){
        regsalida=new RegistroSalida();
        cliente=new Cliente();
        comprobante=new ComprobanteEmitido();
        nOperacion.setText("");
        nOperacion.focus();
        txtDocumento.setText("");
        txtCliente.setText("");
        txtDireccion.setText("");
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
    }
    
    
    private void cargarPie(){        
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }
    
    public void imprimir() throws JRException{
        TipoPago tpago=(TipoPago) modeloPago.getElementAt(cboPago.getSelectedIndex());
        String reporteFuente;
        DecimalFormatSymbols simbolos=new DecimalFormatSymbols();
        simbolos.setDecimalSeparator('.');
        
            NumerosLetras numeroletras = new NumerosLetras();
            HashMap parametro = new HashMap();
            parametro.put("UNIDADNEGOCIO", regsalida.getIdunidad().getCnomunidad().trim());
            if(txtCliente.getText().isEmpty()){
                parametro.put("CLIENTE",cliente.getCnomcli());
                parametro.put("DIRECCION", cliente.getCdircli());
                parametro.put("DNI", "");
            }
            else{
                parametro.put("CLIENTE", txtCliente.getText().toUpperCase());
                parametro.put("DIRECCION", txtDireccion.getText().toUpperCase());
                parametro.put("DNI", txtDocumento.getText().toUpperCase());
            }
            
            parametro.put("RUC", txtDocumento.getText().toUpperCase());
            parametro.put("DISTRITO", regsalida.getIdcliente().getIdubigeo().getCubigeo().trim());
            parametro.put("PROVINCIA", regsalida.getIdcliente().getIdubigeo().getCnomprovincia().trim());
            parametro.put("DEPARTAMENTO", regsalida.getIdcliente().getIdubigeo().getCnomdepartamento().trim());
            parametro.put("FECHA", regsalida.getDfecha());            
            parametro.put("VENCIMIENTO", comprobante.getDfecven());    
            parametro.put("VENDEDOR", regsalida.getIdvendedor().getIdvendedor());
            parametro.put("CONDICION", regsalida.getIdcondicion().getCnomcondicion());
            parametro.put("HORAIMP", regsalida.getDfecimp());
            parametro.put("OPERACION", regsalida.getIdregsalida());
            parametro.put("HORADIG", regsalida.getDfecreg());
            parametro.put("VALORVENTA", regsalida.getNafecto());
            parametro.put("IGV", regsalida.getNigv());
            parametro.put("IMPORTE", regsalida.getNimporte());
            parametro.put("SERIE", comprobante.getCserie());
            parametro.put("NUMERO",comprobante.getCnumero());
            parametro.put("PIEDOCUMENTO", regsalida.getCglosa());
            parametro.put("TIPOPAGO", tpago.getCnomtipo());            
            
            parametro.put("USUARIO","Caja: "+ usuario.getCabrev()+" Vend.: "+regsalida.getIdvendedor().getCabrev());
            parametro.put("LETRAS", numeroletras.convertirLetras(regsalida.getNimporte()));
           
            if(regsalida.getIddocumento().getCcodigosunat().contains(Documento.BOLETA_SUNAT.getCcodigosunat())){
                 reporteFuente = "/resources/boleta.jrxml";
            }
            else
            {
                reporteFuente = "/resources/factura.jrxml";
            }
            
            InputStream is = this.getClass().getClassLoader().getResourceAsStream(reporteFuente);
            JasperReport reportecompilado = JasperCompileManager.compileReport(is);
            JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
            menuimpresion.dialogoImpresion(false);
            menuimpresion.imprimirReporte(reportecompilado,regsalida.hashCode() , parametro, data);
    }
    
    
    
    public void registrar() throws JRException {
        TipoPago tpago=(TipoPago) modeloPago.getElementAt(cboPago.getSelectedIndex());
        regsalida.setDfecimp(dFecha.getValue());
        regsalida.setCnomcli(txtCliente.getText().toUpperCase());
        if(txtDocumento.getText().trim().length()==8){
            regsalida.setCdni(txtDocumento.getText());
        }       
        
        if(cliente.getIdcliente()!=null){
            regsalida.setIdcliente(cliente);
        }        
        comprobante=colaImpresionService.crearDocumento(regsalida, tpago, usuario);        
        regsalida=comprobante.getIdregsalida();
        btnGrabar.setDisabled(true);
        btnImprimir.setDisabled(false);           
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea imprimir? "+comprobante.getIddocumento().getCabrev()+" "+comprobante.getCserie()+"-"+comprobante.getCnumero(), "Impresion Documento", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            imprimir();
        }
    }
}


