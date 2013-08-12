package modalmacen.registro;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.PeriodoService;
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
public class RegistroDocumento extends SelectorComposer {
    
    private CuentaPagar cuentapagar=new CuentaPagar();
    private RegistroEntrada rentrada;
    private Periodo periodo;
    private ListModelList modeloDocumento;
    private ListModelList modeloMoneda;
    
    @Wire
    private Window winDocumentoFinanzas;
    @Wire
    private Textbox txtNombre;    
    @Wire
    private Textbox txtRuc;    
    @Wire
    private Combobox cboDocumento;    
    @Wire
    private Textbox txtSerfac;    
    @Wire
    private Textbox txtNumfac;    
    @Wire
    private Textbox txtSergui;    
    @Wire
    private Textbox txtNumgui;
    @Wire
    private Datebox dFecemi;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Datebox dFecven;
    @Wire
    private Decimalbox nAfecto;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Textbox txtIgv;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nPreven;
    @Wire
    private Decimalbox nPercepcion;
    @Wire
    private Decimalbox nDevolucion;
    @Wire
    private Decimalbox nDescuento;
    @Wire
    private Decimalbox nDiferencia;
    @Wire
    private Decimalbox nIngreso;
    @Wire
    private Combobox cboMoneda;
    @Wire
    private Decimalbox nTcambio;
    
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    @WireVariable
    DocumentoService documentoService;
    @WireVariable
    MonedaService monedaService;
    @WireVariable
    PeriodoService periodoService;
    
    @Listen("onCreate=window#winDocumentoFinanzas")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onChange = #nPlazo")
    public void onCambioPlazo(Event event) {
        calculaFechaVen();
    }
    
    @Listen("onChange = #dFecemi")
    public void onCambioEmision(Event event) {
        calculaFechaVen();
    }
    
    @Listen("onClick = #btnGrabar")
    public void onGrabar(Event event) {
        registrar();
    }

    private void initComponets(){
        rentrada=(RegistroEntrada) winDocumentoFinanzas.getAttribute("RENTRADA");
        modeloMoneda = new ListModelList(monedaService.listaGeneral());
        cboMoneda.setModel(modeloMoneda);
        if (modeloMoneda.size() > 0) {
            cboMoneda.onInitRender(new Event("", cboMoneda));
            cboMoneda.close();
            cboMoneda.setSelectedIndex(0);
        }
        modeloDocumento = new ListModelList(documentoService.listaDocumentoCompra());
        cboDocumento.setModel(modeloDocumento);
        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }
        cboDocumento.setSelectedIndex(modeloDocumento.indexOf(rentrada.getIddocumento()));
        periodo = periodoService.buscarPorDfecha(new Date());
        txtIgv.setText(periodo.getNigv() + " %");
        cargarDatos();
    }

    private void calculaFechaVen(){
      cuentapagar.setDfecemi(dFecemi.getValue());
      cuentapagar.setNplazo(nPlazo.getValue());
      dFecven.setValue(cuentapagar.calculaVencimiento());
    }
    public void cargarDatos(){
        txtNombre.setText(rentrada.getIdproveedor().getCnomprovee());
        txtRuc.setText(rentrada.getIdproveedor().getCruc());
        //
        txtSerfac.setText(rentrada.getCserie());
        txtNumfac.setText(rentrada.getCnumero());
        dFecemi.setValue(new Date());
        dFecven.setValue(new Date());
        nPlazo.setValue(rentrada.getIdproveedor().getNplazo());
        calculaFechaVen();
        //
        nAfecto.setValue(rentrada.getNafecto());
        nInafecto.setValue(rentrada.getNinafecto());
        nIgv.setValue(rentrada.getNigv());
        nPreven.setValue(rentrada.getNimporte());
        nIngreso.setValue(rentrada.getNimporte());
    }

    public void calcula() {
        cuentapagar.setNafecto(nAfecto.getValue());
        cuentapagar.setNigv(nIgv.getValue());
        cuentapagar.setNimporte(nPreven.getValue());
        cuentapagar.setNinafecto(nInafecto.getValue());
        cuentapagar.setNpercepcion(nPercepcion.getValue());
        cuentapagar.setNreclamodevolucion(nDevolucion.getValue());
        cuentapagar.setNreclamoprecio(nDescuento.getValue());
        cuentapagar.calcula(periodo.getNigv());        
        llenar();
    }

    private void llenar() {
        nAfecto.setValue(cuentapagar.getNafecto());
        nInafecto.setValue(cuentapagar.getNinafecto());
        nIgv.setValue(cuentapagar.getNigv());
        nPreven.setValue(cuentapagar.getNimporte());
        nDescuento.setValue(cuentapagar.getNreclamoprecio());
        nDevolucion.setValue(cuentapagar.getNreclamodevolucion());
    }

    public void registrar() {
            validar();
            llenarDatos();
            cuentapagar.validarTotalesIngreso();
            winDocumentoFinanzas.setAttribute("CUENTASPAGAR", cuentapagar);
            winDocumentoFinanzas.onClose();
    }

    private void llenarDatos(){
            Moneda moneda = (Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
            Documento documento=(Documento) modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
            cuentapagar.setIddocumento(documento);
            cuentapagar.setIdmoneda(moneda);
            cuentapagar.setIdproveedor(rentrada.getIdproveedor());
            cuentapagar.setCserie(txtSerfac.getText());
            cuentapagar.setCnumero(txtNumfac.getText());
            cuentapagar.setCsergui(txtSergui.getText());
            cuentapagar.setCnumgui(txtNumgui.getText());
            cuentapagar.setDfecemi(dFecemi.getValue());
            cuentapagar.setNafecto(nAfecto.getValue());
            cuentapagar.setNinafecto(nInafecto.getValue());
            cuentapagar.setNigv(nIgv.getValue());
            cuentapagar.setNimporte(nPreven.getValue());
            cuentapagar.setNplazo(nPlazo.getValue());
            cuentapagar.setNpercepcion(nPercepcion.getValue());
            cuentapagar.setDfecven(dFecven.getValue());
            cuentapagar.setIdunidad(rentrada.getIdalmacen().getIdunidad());
            cuentapagar.setNreclamodevolucion(nDevolucion.getValue());
            cuentapagar.setNreclamoprecio(nDescuento.getValue());
            cuentapagar.setNtipocambio(nTcambio.getValue());
    }
    public void doImporte(){
        nPreven.setValue(nAfecto.getValue().subtract(nInafecto.getValue()).add(nIgv.getValue()));        
    }
   
    private void validar(){
        cboMoneda.getValue();
        cboDocumento.getValue();
    }
}
