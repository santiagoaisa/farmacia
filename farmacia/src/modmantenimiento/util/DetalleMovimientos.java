package modmantenimiento.util;

import com.zarcillo.domain.ComprobanteEmitido;
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
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class DetalleMovimientos extends SelectorComposer{
    
    private Usuario usuario;   
    private RegistroSalida regsalida=new RegistroSalida();
    private ListModelList modeloDetalle;
    private ListModelList modeloDocumento;
    private ComprobanteEmitido comprobante;
    private UnidadNegocio unidad;
    
    @Wire
    private Window winFactura;
    
    @Wire
    private Combobox cboDocumento;
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
    
    @Listen("onCreate=window#winFactura")
    public void onCreate() throws NamingException {   
        initComponets();
     }
    
         
     @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) throws JRException {
         imprimir();
    }
            
    public void initComponets(){
        comprobante=(ComprobanteEmitido) winFactura.getAttribute("COMPROBANTE");
        unidad=(UnidadNegocio) winFactura.getAttribute("UNIDAD");
        usuario=(Usuario) winFactura.getAttribute("USUARIO");        
        modeloDocumento = new ListModelList(documentoService.listaDocumentoVenta()); 
        cboDocumento.setModel(modeloDocumento);
        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }
        llenarDatos();
    } 
    
    private void llenarDatos(){  
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), comprobante.getIdregsalida().getIdregsalida());        
        modeloDetalle=new ListModelList(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        lstDetalle.setModel(modeloDetalle);        
        dFecha.setValue(comprobante.getDfecemi());
        nOperacion.setValue(comprobante.getIdregsalida().getIdregsalida());
        cboDocumento.setSelectedIndex(modeloDocumento.indexOf(comprobante.getIddocumento()));
        txtSerie.setText(comprobante.getCserie());
        txtNumero.setText(comprobante.getCnumero());
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
       
    
    private void cargarPie(){        
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }
    
    public void imprimir(){
        
    }
}



