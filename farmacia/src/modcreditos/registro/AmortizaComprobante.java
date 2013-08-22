package modcreditos.registro;

import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.TipoPagoService;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Textbox;
import java.util.Date;
import javax.naming.NamingException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AmortizaComprobante extends SelectorComposer {

    private AmortizacionCliente amortizacion=new AmortizacionCliente();
    private ComprobanteEmitido comprobante=new ComprobanteEmitido();
    private ListModelList modeloForma;
    private ListModelList modeloMoneda;
    @Wire
    private Window winAmortizacion;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Datebox dFecha;
    @Wire
    private Combobox cboForma;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Combobox cboMoneda;
    @Wire
    private Decimalbox nTcambio;
    @Wire
    private Textbox txtObservacion;
    @Wire
    private Toolbarbutton btnGrabar;
    
    @WireVariable 
    MonedaService monedaService;
    @WireVariable
    TipoPagoService tipoPagoService;

    @Listen("onCreate=window#winAmortizacion")
    public void onCreate() throws NamingException {
        initComponets();
    }    
    
    @Listen("onClick = #btnGrabar")
    public void onImprimir(Event event) {
        registrar();
    }
    

    private void initComponets() {        
        comprobante =(ComprobanteEmitido) winAmortizacion.getAttribute("COMPROBANTE");
        modeloForma=new ListModelList(tipoPagoService.listaTipoPagoCliente());
        cboForma.setModel(modeloForma);
        if (modeloForma.size() > 0) {
            cboForma.onInitRender(new Event("", cboForma));
            cboForma.close();
            cboForma.setSelectedIndex(0);
        }
        modeloMoneda=new ListModelList(monedaService.listaGeneral());
        cboMoneda.setModel(modeloMoneda);
        if (modeloMoneda.size() > 0) {
            cboMoneda.onInitRender(new Event("", cboMoneda));
            cboMoneda.close();
            cboMoneda.setSelectedIndex(0);
        }
        dFecha.setValue(new Date());
        llenarDatos();
    }
    
    private void llenarDatos(){   
        txtSerie.setText(comprobante.getCserie());
        txtNumero.setText(comprobante.getCnumero());
        nImporte.setValue(comprobante.getNsaldo());        
        cboMoneda.setSelectedIndex(modeloMoneda.indexOf(comprobante.getIdmoneda()));
        btnGrabar.focus();
    }
    
    
   private void registrar(){
       TipoPago tpago=(TipoPago) modeloForma.getElementAt(cboForma.getSelectedIndex());
       Moneda moneda=(Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
       amortizacion.setIddocumento(comprobante.getIddocumento());
       amortizacion.setDfecha(dFecha.getValue());
       amortizacion.setIdtipo(tpago);
       amortizacion.setIdmoneda(moneda);
       amortizacion.setNimporte(nImporte.getValue());
       amortizacion.setNtipocambio(nTcambio.getValue());
       amortizacion.setCreferencia(txtObservacion.getText());
       winAmortizacion.setAttribute("AMORTIZACION", amortizacion);
       winAmortizacion.onClose();
   }

    
}
