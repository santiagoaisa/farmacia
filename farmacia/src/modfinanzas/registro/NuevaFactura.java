package modfinanzas.registro;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.service.CuentaPagarService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroEntradaService;
import java.util.Date;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Textbox;
import javax.naming.NamingException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class NuevaFactura extends SelectorComposer {

    private CuentaPagar cpagar=new CuentaPagar();
    private ListModelList modeloDocumento;
    private ListModelList modeloMoneda;
    private Periodo periodo;
    @Wire
    private Window winFactura;
    @Wire
    private Datebox dFecemi;
    @Wire
    private Datebox dFecven;
    @Wire
    private Combobox cboDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Textbox txtSergui;
    @Wire
    private Textbox txtNumgui;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Combobox cboMoneda;
    @Wire
    private Decimalbox nAfecto;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Intbox nOperacion;
    @WireVariable
    CuentaPagarService cuentaPagarService;
    @WireVariable 
    MonedaService monedaService;
    @WireVariable
    DocumentoService documentoService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    RegistroEntradaService registroEntradaService;

    @Listen("onCreate=window#winFactura")
    public void onCreate() throws NamingException {
        initComponets();
    }
        
    @Listen("onChange = #nPlazo")
    public void onCambioPlazo(Event event) {
        cargarVencimiento();
    }
    
    @Listen("onChange = #dFecemi")
    public void onCambioEmision(Event event) {
        cargarVencimiento();
    }
    
    @Listen("onChange = #dFecven")
    public void onCambioVencimiento(Event event) {
        cargarPlazo();
    }
    
    @Listen("onChange = #nAfecto")
    public void onAfecto(Event event) {
        calculaImporte();
    }
    
    @Listen("onChange = #nInafecto")
    public void onInafecto(Event event) {
        calculaImporte();
    }
    
    @Listen("onClick = #btnRegistrar")
    public void onRegistrar(Event event) {
        registrar();
    }    
    
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winFactura.onClose();
    }
    

    private void initComponets() {       
        cpagar =  (CuentaPagar) winFactura.getAttribute("CUENTAPAGAR");
        modeloDocumento=new ListModelList(documentoService.listaDocumentoCompra());
        cboDocumento.setModel(modeloDocumento);
        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }
        modeloMoneda=new ListModelList(monedaService.listaGeneral());
        cboMoneda.setModel(modeloMoneda);
        if (modeloMoneda.size() > 0) {
            cboMoneda.onInitRender(new Event("", cboMoneda));
            cboMoneda.close();
            cboMoneda.setSelectedIndex(0);
        }      
        dFecemi.setValue(new Date());
        dFecven.setValue(new Date());
    }    
    
    public void cargarVencimiento() {
        cpagar.setDfecemi(dFecemi.getValue());
        cpagar.setNplazo(nPlazo.getValue());
        cpagar.calculaVencimiento();
        dFecven.setValue(cpagar.getDfecven());
    }    
    
    public void registrar(){
        Moneda moneda = (Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
        Documento documento=(Documento) modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
        if(!nOperacion.getText().isEmpty()){
            RegistroEntrada regentrada=registroEntradaService.buscarPorIdalmacenPorIdregentrada(1,nOperacion.getValue());
            cpagar.setIdregentrada(regentrada);
        }
        cpagar.setIdmoneda(moneda);
        cpagar.setIddocumento(documento);
        cpagar.setCserie(txtSerie.getText().trim());
        cpagar.setCnumero(txtNumero.getText().trim());
        cpagar.setCsergui(txtSergui.getText().trim());
        cpagar.setCnumgui(txtNumgui.getText().trim());
        cpagar.setNafecto(nAfecto.getValue());
        cpagar.setNinafecto(nInafecto.getValue());
        cpagar.setNigv(nIgv.getValue());
        cpagar.setDfecemi(dFecemi.getValue());
        cpagar.setNplazo(nPlazo.getValue());
        cpagar.setDfecven(dFecven.getValue());  
        cpagar.setNimporte(nImporte.getValue());
        cpagar=cuentaPagarService.registrar(cpagar);
        Messagebox.show("REGISTRO CREADO SATISFACTORIAMENTE");
        winFactura.setAttribute("REST", true);
        winFactura.setAttribute("CUENTAPAGAR",cpagar);     
        winFactura.onClose();
    }
    
    public void cargarPlazo() {
        Long time = dFecven.getValue().getTime() - dFecemi.getValue().getTime();
        Long dias = time / (3600 * 24 * 1000);
        nPlazo.setValue(dias.intValue());
    }    
    public void calculaImporte(){
        periodo = periodoService.buscarPorDfecha(new Date());
        cpagar.setNafecto(nAfecto.getValue());
        cpagar.setNinafecto(nInafecto.getValue());
        cpagar.calcula(periodo.getNigv());
        nAfecto.setValue(cpagar.getNafecto());
        nInafecto.setValue(cpagar.getNinafecto());
        nIgv.setValue(cpagar.getNigv());
        nImporte.setValue(cpagar.getNimporte());
    }       
}