package modventas.consulta;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.ColaImpresionService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.TipoPagoService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormatSymbols;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import javax.naming.NamingException;
import modmantenimiento.util.MenuImpresion;
import modmantenimiento.util.NumerosLetras;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
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
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ConsultaFactura extends SelectorComposer{
    
    private Usuario usuario;   
    private RegistroSalida regsalida=new RegistroSalida();
    private ListModelList modeloDetalle;
    private ListModelList modeloUnidad;
    private ComprobanteEmitido comprobante;
    
    @Wire
    private Window winFactura;
    
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Datebox dFecha;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Textbox txtCliente;
    @Wire
    private Textbox txtDocumento;
    @Wire
    private Textbox txtDireccion;
    @Wire
    private Textbox txtCondicion;
    @Wire
    private Textbox txtPago;
    @Wire
    private Textbox txtVendedor;
        
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
    DocumentoService documentoService;
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();   
    
    private MenuImpresion menuimpresion;
    
    
    @Listen("onCreate=window#winFactura")
    public void onCreate() throws NamingException {   
        HtmlMacroComponent macro = (HtmlMacroComponent) winFactura.getFellow("mimpresion");
        menuimpresion = (MenuImpresion) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("  onOK = #txtSerie ")
    public void onFocoNumero() {
        txtNumero.focus();
    }
    @Listen("  onOK = #txtNumero ")
    public void buscarRegsalida() {
        buscarComprobante();
    }
    
      
     @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
         imprimir();
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
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecha.setValue(new Date());
        txtSerie.focus();
    } 
    
    private void buscarComprobante(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());        
        Documento documento=documentoService.buscarPorCcodigosunat(Documento.FACTURA_SUNAT.getCcodigosunat());
        comprobante=comprobanteEmitidoService.buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(unidad.getIdunidad(),documento.getIddocumento(),txtSerie.getText(),txtNumero.getText());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), comprobante.getIdregsalida().getIdregsalida());
        llenarDatos();
    }
    
    private void llenarDatos(){        
        modeloDetalle=new ListModelList(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        lstDetalle.setModel(modeloDetalle);        
        dFecha.setValue(comprobante.getDfecemi());
        nOperacion.setValue(comprobante.getIdregsalida().getIdregsalida());
        txtCliente.setText(comprobante.getIdcliente().getCnomcli());
        txtDocumento.setText(comprobante.getIdcliente().getCruc());
        txtDireccion.setText(comprobante.getIdcliente().getCdircli());
        txtCondicion.setText(comprobante.getIdcondicion().getCnomcondicion());
        txtVendedor.setText(comprobante.getIdvendedor().getCnomvendedor());
        if(comprobante.getNsaldo().compareTo(BigDecimal.ZERO)==0){
            txtPago.setText("CANCELADO");
        }
        cargarPie();
    }  
    
    public void limpiar(){
        regsalida=new RegistroSalida();
        comprobante=new ComprobanteEmitido();
        nOperacion.setText("");
        nOperacion.focus();
        txtDocumento.setText("");
        txtCliente.setText("");
        txtDireccion.setText("");
        txtSerie.setText("");
        txtNumero.setText("");
        txtCondicion.setText("");
        txtPago.setText("");
        txtVendedor.setText("");
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        cargarPie();
    }
    
    
    private void cargarPie(){        
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }
    
    public void imprimir() throws JRException {
        String reporteFuente;
        DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
        simbolos.setDecimalSeparator('.');
        NumerosLetras numeroletras = new NumerosLetras();
        HashMap parametro = new HashMap();
        parametro.put("UNIDADNEGOCIO", regsalida.getIdunidad().getCnomunidad().trim());


        if (regsalida.getIddocumento().getCcodigosunat().contains(Documento.FACTURA_SUNAT.getCcodigosunat())) {
            parametro.put("CLIENTE", comprobante.getIdcliente().getCnomcli());
            parametro.put("DIRECCION", comprobante.getIdcliente().getCdircli());
            parametro.put("RUC", comprobante.getIdcliente().getCruc());
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
        parametro.put("SERIE", comprobante.getCserie());
        parametro.put("NUMERO", comprobante.getCnumero());
        parametro.put("GLOSA", regsalida.getCglosa());
        parametro.put("USUARIO", "Caja: " + usuario.getCabrev() + " Vend.: " + regsalida.getIdvendedor().getCabrev());
        parametro.put("LETRAS", numeroletras.convertirLetras(regsalida.getNimporte()));
        parametro.put(JRParameter.REPORT_LOCALE,new Locale("es", "US"));
        if (regsalida.getIddocumento().getCcodigosunat().contains(Documento.BOLETA_SUNAT.getCcodigosunat())) {
            reporteFuente = "/resources/boleta.jrxml";
        } else {
            reporteFuente = "/resources/factura.jrxml";
        }

        InputStream is = this.getClass().getClassLoader().getResourceAsStream(reporteFuente);
        JasperReport reportecompilado = JasperCompileManager.compileReport(is);
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        menuimpresion.dialogoImpresion(true);
        menuimpresion.imprimirReporte(reportecompilado, regsalida.hashCode(), parametro, data);
    }
}



