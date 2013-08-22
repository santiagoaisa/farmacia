package modcreditos.consulta;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ClienteService;
import com.zarcillo.service.ColaImpresionService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.TipoPagoService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.math.BigDecimal;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.JRException;
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
import org.zkoss.zul.Label;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AmortizacionComprobante extends SelectorComposer{
    
    private Usuario usuario;   
    private RegistroSalida regsalida=new RegistroSalida();
    private ListModelList modeloAmortizacion;
    private ListModelList modeloDocumento;
    private ComprobanteEmitido comprobante;
    
    @Wire
    private Window winFactura;
    
    @Wire
    private Combobox cboDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Textbox txtCliente;
    @Wire
    private Textbox txtCondicion;
    @Wire    
    private Datebox dFecemi;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Datebox dFecven;
    @Wire
    private Datebox dFeccan;
    @Wire
    private Label lblCancelado;
           
    @Wire
    private Listbox lstAmortizacion;
    
    @Wire
    private Decimalbox nInafecto;
    
    @Wire
    private Decimalbox nIgv;
    
    @Wire
    private Decimalbox nAfecto;
    
    @Wire
    private Decimalbox nImporte;
    
    @Wire
    private Decimalbox nNotabo; 
    @Wire
    private Decimalbox nNotcar; 
    @Wire
    private Decimalbox nSaldo; 
    @Wire
    private Decimalbox nAcuenta; 
    
    @Wire
    private Toolbarbutton btnAmortizar;
    
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
        
    
    @Listen("onCreate=window#winFactura")
    public void onCreate() throws NamingException {   
        initComponets();
     }
    
    @Listen("onClick = #btnAmortizar")
    public void onAmortizar(Event event) throws JRException {
         amortizar();
    }    
      
     @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
         imprimir();
    }
        
    public void initComponets(){
        comprobante=(ComprobanteEmitido) winFactura.getAttribute("COMPROBANTE");
        modeloDocumento = new ListModelList(documentoService.listaDocumentoVenta()); 
        cboDocumento.setModel(modeloDocumento);
        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }
        modeloAmortizacion=new ListModelList();
        lstAmortizacion.setModel(modeloAmortizacion);
        llenarDatos();
    } 
    
    private void llenarDatos(){
        cboDocumento.setSelectedIndex(modeloDocumento.indexOf(comprobante.getIdcomprobante()));
        txtSerie.setText(comprobante.getCserie());
        txtNumero.setText(comprobante.getCnumero());
        txtCondicion.setText(comprobante.getIdcondicion().getCnomcondicion());
        txtCliente.setText(comprobante.getIdcliente().getCnomcli());
        dFecemi.setValue(comprobante.getDfecemi());
        nPlazo.setValue(comprobante.getNplazo());
        dFecven.setValue(comprobante.getDfecven());
        dFeccan.setValue(comprobante.getDfeccan());
        nAfecto.setValue(comprobante.getNafecto());
        nInafecto.setValue(comprobante.getNinafecto());
        nIgv.setValue(comprobante.getNigv());
        nImporte.setValue(comprobante.getNimporte());
        nNotabo.setValue(comprobante.getNnotabo());
        nNotcar.setValue(comprobante.getNnotcar());
        nAcuenta.setValue(comprobante.getNacuenta());
        nSaldo.setValue(comprobante.getNsaldo());
        if (comprobante.getNsaldo().equals(new BigDecimal("0.00"))) {
            lblCancelado.setStyle(" font-weight:bold; font-size:18px;  color : #FE1010");            
            lblCancelado.setValue("CANCELADO ");
            btnAmortizar.setDisabled(true);
        } 
        modeloAmortizacion=new ListModelList(comprobanteEmitidoService.listaAmortizaciones(comprobante.getIdcomprobante()));
        lstAmortizacion.setModel(modeloAmortizacion);
    }
    
    private void amortizar(){
        
    }
    
    
    
    
    public void imprimir()  {
        
    }
}




