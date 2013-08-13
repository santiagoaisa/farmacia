package modventas.herramientas;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ColaImpresionService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.TipoPagoService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;
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
    private Toolbarbutton btnGrabar;
    
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
    PeriodoService periodoService;
    
    @WireVariable
    RegistroSalidaService registroSalidaService;
    
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
     
     @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
         imprimir();
    }
    
    @Listen("onClick = #btnGrabar")
    public void onRegistrar(Event event) {
        registrar();
    } 
        
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);  
        modeloUnidad=new ListModelList(unidadNegocioService.listaGeneral());
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
        nOperacion.focus();
    }    
   
    private void buscar(int operacion){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), operacion);
        modeloDetalle=new ListModelList(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    
    private void cargarPie(){        
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }
    
    public void imprimir() throws JRException{
        String reporteFuente;
        DecimalFormatSymbols simbolos=new DecimalFormatSymbols();
        simbolos.setDecimalSeparator('.');
        
            NumerosLetras numeroletras = new NumerosLetras();
            HashMap parametro = new HashMap();
            parametro.put("UNIDADNEGOCIO", regsalida.getIdunidad().getCnomunidad().trim());
            parametro.put("CLIENTE", regsalida.getIdcliente().getCnomcli());
            parametro.put("DIRECCION", regsalida.getIdcliente().getCdircli());
            parametro.put("DNI", regsalida.getIdcliente().getCdni());
            parametro.put("DISTRITO", regsalida.getIdcliente().getIdubigeo().getCubigeo().trim());
            parametro.put("PROVINCIA", regsalida.getIdcliente().getIdubigeo().getCnomprovincia().trim());
            parametro.put("DEPARTAMENTO", regsalida.getIdcliente().getIdubigeo().getCnomdepartamento().trim());
            parametro.put("FECHA", regsalida.getDfecha());            
            parametro.put("VENDEDOR", regsalida.getIdvendedor().getIdvendedor());
            parametro.put("CONVEN", regsalida.getIdcondicion().getCnomcondicion());
            parametro.put("HORAIMP", regsalida.getDfecimp());
            parametro.put("OPERACION", regsalida.getIdregsalida());
            parametro.put("HORADIG", regsalida.getDfecreg());
            parametro.put("IMPORTE", regsalida.getNimporte());
            parametro.put("SERIE", regsalida.getCserie());
            parametro.put("NUMERO",regsalida.getCnumero());
            parametro.put("PIEDOCUMENTO", regsalida.getCglosa());
            parametro.put("LETRAS", numeroletras.convertirLetras(regsalida.getNimporte()));
           
            if(regsalida.getIddocumento().getCcodigosunat().contains(Documento.BOLETA_SUNAT.getCcodigosunat())){
                 reporteFuente = "/resources/boleta.jrxml";
            }
            else
            {
                reporteFuente = "/modulos/ventas/reporte/factura.jrxml";
            }
            
            InputStream is = this.getClass().getClassLoader().getResourceAsStream(reporteFuente);
            JasperReport reportecompilado = JasperCompileManager.compileReport(is);
            JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
            menuimpresion.dialogoImpresion(true);
            menuimpresion.imprimirReporte(reportecompilado,regsalida.hashCode() , parametro, data);
    }
    
    
    
    public void registrar() {
        TipoPago tpago=(TipoPago) modeloPago.getElementAt(cboPago.getSelectedIndex());
        regsalida.setIdusuario(usuario);
        regsalida.setDfecimp(dFecha.getValue());
        
    }
}


