package modfinanzas.consulta;

import com.zarcillo.domain.AmortizacionProveedor;
import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.CuentaPagarService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.MonedaService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.UsuarioService;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import java.util.Date;
import java.util.HashMap;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarPdf;
 
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class DetalleFactura extends SelectorComposer {

    private CuentaPagar cpagar=new CuentaPagar();
    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloDocumento;
    private ListModelList modeloMoneda;
    private Periodo periodo;
    @Wire
    private Window winFactura;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Datebox dFecemi;
    @Wire
    private Datebox dFecven;
    @Wire
    private Datebox dFeccan;
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
    private Decimalbox nAcuenta;
    @Wire
    private Decimalbox nNotabo;
    @Wire
    private Decimalbox nNotcar;
    @Wire
    private Decimalbox nSaldo;
    @Wire
    private Listbox lstDetalle;    
    @Wire
    private Textbox txtIgv;
    @Wire
    private Toolbarbutton btnAmortizar;
    @Wire
    private Toolbarbutton btnRegistrar;
    @Wire
    private Toolbarbutton btnModificar;
    @Wire
    private Toolbarbutton btnEliminar;
    @Wire
    private Toolbarbutton btnCancelar;
     
    @WireVariable
    CuentaPagarService cuentaPagarService;
    @WireVariable 
    MonedaService monedaService;
    @WireVariable
    DocumentoService documentoService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    PeriodoService periodoService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winFactura")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onOK = #lstDetalle")
    public void onDesamortizar(Event event) {
        eliminarAmortizacion();
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
    
    @Listen("onClick = #btnAmortizar")
    public void onAmortizar(Event event) {
        amortizar();
    }
    
    @Listen("onClick = #btnRegistrar")
    public void onRegistrar(Event event) {
        registrar();
    }
    
    @Listen("onClick = #btnCancelar")
    public void onCancelar(Event event) {
        cancelar();
    }
    
    @Listen("onClick = #btnModificar")
    public void onModificar(Event event) {
        modificar();
    }
    
    @Listen("onClick = #btnEliminar")
    public void onEliminar(Event event) {
        eliminar();
    }
    
    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) {
        imprimir();
    }
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winFactura.onClose();
    }
    

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);        
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
        periodo = periodoService.buscarPorDfecha(new Date());
        txtIgv.setText(periodo.getNigv() + " %");
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        llenarDatos();
    }
    
    private void llenarDatos(){        
        cboDocumento.setSelectedIndex(modeloDocumento.indexOf(cpagar.getIddocumento()));
        txtSerie.setText(cpagar.getCserie());
        txtNumero.setText(cpagar.getCnumero());
        txtSergui.setText(cpagar.getCsergui());
        txtNumgui.setText(cpagar.getCnumgui());
        nOperacion.setValue(cpagar.getIdcuenta());
        nPlazo.setValue(cpagar.getNplazo());
        dFecemi.setValue(cpagar.getDfecemi());
        dFecven.setValue(cpagar.getDfecven());
        dFeccan.setValue(cpagar.getDfeccan());
        cboMoneda.setSelectedIndex(modeloMoneda.indexOf(cpagar.getIdmoneda()));
        nAfecto.setValue(cpagar.getNafecto());
        nInafecto.setValue(cpagar.getNinafecto());
        nIgv.setValue(cpagar.getNigv());
        nImporte.setValue(cpagar.getNimporte());
        nAcuenta.setValue(cpagar.getNacuenta());
        nNotabo.setValue(cpagar.getNnotabo());
        nNotcar.setValue(cpagar.getNnotcar());
        nSaldo.setValue(cpagar.getNsaldo());
        modeloDetalle=new ListModelList(cuentaPagarService.listaAmortizaciones(cpagar.getIdcuenta()));
        lstDetalle.setModel(modeloDetalle);
    }
    
    public void cargarVencimiento() {
        cpagar.setDfecemi(dFecemi.getValue());
        cpagar.setNplazo(nPlazo.getValue());
        cpagar.calculaVencimiento();
        dFecven.setValue(cpagar.getDfecven());
    }
    
    public void amortizar(){
        Window winamortiza = (Window) Executions.createComponents("/modulos/finanzas/registro/amortizafactura.zul", null, null);
        winamortiza.setAttribute("CUENTASPAGAR", cpagar);
        winamortiza.setAttribute("REST", true);
        winamortiza.doModal();
        Boolean rest = (Boolean) winamortiza.getAttribute("REST");
        if (rest) {
            AmortizacionProveedor amortizacion;
            amortizacion =  (AmortizacionProveedor) winamortiza.getAttribute("AMORTIZACION");
            amortizacion.setIdcuenta(cpagar);
            amortizacion.setIdusuario(usuario);
            cpagar=cuentaPagarService.amortizar(amortizacion);
            llenarDatos();
        }
    }
    public void registrar(){
        habilitarBotones(true);
        Moneda moneda = (Moneda) modeloMoneda.getElementAt(cboMoneda.getSelectedIndex());
        Documento documento=(Documento) modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
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
        cpagar.setNacuenta(nAcuenta.getValue());
        cpagar.setNnotabo(nNotabo.getValue());
        cpagar.setNnotcar(nNotcar.getValue());
        cpagar.setNsaldo(nSaldo.getValue());
        cpagar.setNimporte(nImporte.getValue());
        cpagar=cuentaPagarService.actualizar(cpagar);
    }
    private void cancelar() {
        llenarDatos();
        habilitarBotones(true);
    }

    private void modificar() {
        habilitarBotones(false);
    }
    private void eliminar() {
        int resp = Messagebox.show("Esta seguro de Eliminar La Factura \n" + cpagar.getCserie() + " " + cpagar.getCnumero(), "Cuentas Pagar", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            cuentaPagarService.eliminar(cpagar);
            winFactura.setAttribute("REST", false);
            winFactura.onClose();
        }
    }
    
    private void eliminarAmortizacion() {
        AmortizacionProveedor amortizacion = (AmortizacionProveedor) modeloDetalle.getElementAt(lstDetalle.getSelectedIndex());
        int resp = Messagebox.show("Esta seguro de Eliminar Amortizacion \n" , "Amortizacion Factura", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            cpagar = cuentaPagarService.desamortizar(amortizacion);
            llenarDatos();
        }
    }
    
    private void habilitarBotones(Boolean enable) {
        btnAmortizar.setVisible(enable);
        btnModificar.setVisible(enable);
        btnEliminar.setVisible(enable);
        btnRegistrar.setVisible(!enable);
        btnCancelar.setVisible(!enable);
        txtSerie.setReadonly(enable);
        txtNumero.setReadonly(enable);
        txtSergui.setReadonly(enable);
        txtNumgui.setReadonly(enable);
        nAfecto.setReadonly(enable);
        nInafecto.setReadonly(enable);
        nIgv.setReadonly(enable);
        nImporte.setReadonly(enable);
        nPlazo.setReadonly(enable);
        dFecemi.setDisabled(enable);
        dFecven.setDisabled(enable);        
        cboDocumento.setDisabled(enable);        
    }
    
    public void cargarPlazo() {
        Long time = dFecven.getValue().getTime() - dFecemi.getValue().getTime();
        Long dias = time / (3600 * 24 * 1000);
        nPlazo.setValue(dias.intValue());
    }

    public void imprimir()  {
        HashMap parametro = new HashMap();
        parametro.put("RUTA", cpagar.getIdunidad().getIdempresa().getCruta());
        parametro.put("CRUCPRO", cpagar.getIdproveedor().getCruc());
        parametro.put("CNOMPRO", cpagar.getIdproveedor().getCnomprovee());
        parametro.put("CSERIE", cpagar.getCserie());
        parametro.put("CNUMERO", cpagar.getCnumero());
        parametro.put("CDIRPRO", cpagar.getIdproveedor().getCdireccion());
        parametro.put("CUBIGEO", cpagar.getIdproveedor().getIdubigeo().getCubigeo().trim() + " - " + cpagar.getIdproveedor().getIdubigeo().getCnomprovincia().trim() + " - " + cpagar.getIdproveedor().getIdubigeo().getCnomdepartamento().trim());
        parametro.put("DFECHA", cpagar.getDfecemi());
        parametro.put("UNIDADNEGOCIO", cpagar.getIdunidad().getCnomunidad());
        parametro.put("USUARIO", usuario.getCnomusuario());        
        parametro.put("FVEN", cpagar.getDfecven());
        parametro.put("FCAN", cpagar.getDfeccan());
        parametro.put("PLAZO", cpagar.getNplazo());
        parametro.put("VVAFECTO", cpagar.getNafecto());
        parametro.put("VVINAFECTO", cpagar.getNinafecto());
        parametro.put("IGV", cpagar.getNigv());
        parametro.put("NCREDITO", cpagar.getNnotabo());
        parametro.put("NDEBITO", cpagar.getNnotcar());
        parametro.put("PVENTA", cpagar.getNimporte());
        parametro.put("ACUENTA", cpagar.getNacuenta());
        parametro.put("SALDO", cpagar.getNsaldo());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        ExportarPdf.exportJasperToPdf("Factura", data, parametro,"/resources/finanzas/facturaproveedor.jasper");        
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
