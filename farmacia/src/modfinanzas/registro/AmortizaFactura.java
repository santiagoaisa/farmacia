package modfinanzas.registro;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.service.BancoService;
import com.zarcillo.service.CuentaPagarService;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.TipoPagoService;
import java.util.ArrayList;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Textbox;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AmortizaFactura extends SelectorComposer {

    private CuentaPagar cpagar=new CuentaPagar();
    private AmortizacionProveedor amortizacion=new AmortizacionProveedor();
    private ListModelList modeloBanco;
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
    private Label lblBanco;
    @Wire
    private Combobox cboBanco;
    @Wire
    private Label lblNumero;
    @Wire
    private Textbox txtSerori;
    @Wire
    private Textbox txtNumori;
    @Wire 
    private Label lblSaldo;
    @Wire
    private Decimalbox nSalori;
    @Wire
    private Combobox cboMoneda;
    @Wire
    private Decimalbox nTcambio;
    @Wire
    private Textbox txtObservacion;
    @Wire
    private Toolbarbutton btnRegistrar;
    
    @WireVariable
    CuentaPagarService cuentaPagarService;
    @WireVariable 
    MonedaService monedaService;
    @WireVariable
    BancoService bancoService;
    @WireVariable
    TipoPagoService tipoPagoService;

    @Listen("onCreate=window#winAmortizacion")
    public void onCreate() throws NamingException {
        initComponets();
    }    
    
    @Listen("onClick = #btnRegistrar")
    public void onImprimir(Event event) {
        registrar();
    }
    

    private void initComponets() {        
        cpagar =  (CuentaPagar) winAmortizacion.getAttribute("CUENTASPAGAR");
        modeloForma=new ListModelList(tipoPagoService.listaTipoPagoProveedor());
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
        modeloBanco=new ListModelList(bancoService.listaGeneral());
        cboBanco.setModel(modeloBanco);
        dFecha.setValue(new Date());
        llenarDatos();
    }
    
    private void llenarDatos(){   
        habilitarBanco(false);
        habilitarDocumento(false);
        txtSerie.setText(cpagar.getCserie());
        txtNumero.setText(cpagar.getCnumero());
        nImporte.setValue(cpagar.getNsaldo());        
        cboMoneda.setSelectedIndex(modeloMoneda.indexOf(cpagar.getIdmoneda()));
        btnRegistrar.focus();
    }
    private void habilitarBanco(boolean enable){
        lblBanco.setVisible(enable);
        cboBanco.setVisible(enable);
    }
    private void habilitarDocumento(boolean enable){
        lblNumero.setVisible(enable);
        lblSaldo.setVisible(enable);
        txtSerori.setVisible(enable);
        txtNumori.setVisible(enable);
        nSalori.setVisible(enable);
    }
    
   private void registrar(){
       TipoPago tpago=(TipoPago) modeloForma.getElementAt(cboForma.getSelectedIndex());
       Moneda moneda=(Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
       amortizacion.setIddocumento(cpagar.getIddocumento());
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
