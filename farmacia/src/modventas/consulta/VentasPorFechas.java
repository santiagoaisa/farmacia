package modventas.consulta;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.CondicionVentaService;
import com.zarcillo.service.ResultadoVentaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modventas.util.FiltroPorCondicionVenta;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.commons.collections.CollectionUtils;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zarcillo.ExportarPdf;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
 
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class VentasPorFechas extends SelectorComposer {

    private List<VentaPorDocumento> listaDetalle=new ArrayList<>();
    private List<VentaPorDocumento> listaFiltrada=new ArrayList<>();
    private Usuario usuario;
    private ListModelList modeloUnidad;
    private ListModelList modeloDetalle;
    private ListModelList modeloCondicion;
    @Wire
    private Window winVenta;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Combobox cboCondicion;
    @Wire
    private Datebox dFecini;
    @Wire
    private Datebox dFecfin;
    @Wire
    private Button btnProcesar;
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
     
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    ResultadoVentaService resultadoVentaService;
    @WireVariable
    CondicionVentaService condicionVentaService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onSelect = #cboCondicion")
    public void onFiltroCondicion(Event event) {
        filtroCondicion();
    }

    @Listen("onClick = #btnProcesar")
    public void onProcesar(Event event) {
        procesar();
    }

    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) {
        imprimir();
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }
    
    @Listen("onClick = #btnIgnorar")
    public void onLimpiar(Event event) {
        limpiar();
    }
    
    @Listen("onOK = #lstDetalle")
    public void onMostrarDetalle(Event event) {
        mostrarDetalle(lstDetalle.getSelectedIndex());
    }

    
    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin()));
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }        
        modeloCondicion = new ListModelList(condicionVentaService.listaGeneral());
        cboCondicion.setModel(modeloCondicion);
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecini.setValue(new Date());
        dFecfin.setValue(new Date());
        btnProcesar.focus();
    }
    
    private void limpiar(){
        habilitar(false);
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        cboCondicion.setSelectedIndex(-1);
        cboCondicion.setText("");
    }
    private void habilitar(boolean enable){
        cboUnidad.setDisabled(enable);
        dFecini.setDisabled(enable);
        dFecfin.setDisabled(enable);
        btnProcesar.setDisabled(enable);
        cboCondicion.setDisabled(!enable);
    }
    
    private void filtroCondicion(){
        CondicionVenta condicion=(CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        listaFiltrada=(List) CollectionUtils.select(listaDetalle,new FiltroPorCondicionVenta(condicion.getIdcondicion()));
        modeloDetalle = new ListModelList(listaFiltrada);
        lstDetalle.setModel(modeloDetalle);
        cargarPie();
    }

    private void procesar() {
        habilitar(true);
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        listaDetalle=resultadoVentaService.listaVentaPorDocumentoPorIdunidadPorFechas(unidad.getIdunidad(),dFecini.getValue(),dFecfin.getValue());
        listaFiltrada=listaDetalle;
        modeloDetalle = new ListModelList(listaDetalle);
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    private void mostrarDetalle(int index){        
        VentaPorDocumento vpd=(VentaPorDocumento) modeloDetalle.getElementAt(index);
        ComprobanteEmitido comprobante=new ComprobanteEmitido();
        comprobante=comprobanteEmitidoService.buscarPorIdregsalida(vpd.getIdregsalida());
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/detallemovimientos.zul", null, null);
        wincrea.setAttribute("COMPROBANTE", comprobante);
        wincrea.setAttribute("UNIDAD", unidad);
        wincrea.setAttribute("USUARIO", usuario);
        wincrea.doModal();
    }

    private void cargarPie() {
        BigDecimal nafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal ninafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        VentaPorDocumento vpd;
        for (Listitem item : ldatos) {
            vpd=(VentaPorDocumento) modeloDetalle.getElementAt(item.getIndex());
            nafecto = nafecto.add(vpd.getNafecto());
            ninafecto = ninafecto.add(vpd.getNinafecto());
            nigv = nigv.add(vpd.getNigv());
            nprecio = nprecio.add(vpd.getNimporte());
        }
        nInafecto.setValue(ninafecto);
        nValven.setValue(nafecto);
        nIgv.setValue(nigv);
        nImporte.setValue(nprecio);
    }    

    private void validar() {
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.getValue();
    }
    
    private void imprimir(){
        validar();
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());        
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECINI", dFecini.getValue());
        parametro.put("FECFIN", dFecfin.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());
        if(cboCondicion.getSelectedIndex()!=-1){
            CondicionVenta condicion=(CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
            parametro.put("VENDEDOR", condicion.getCnomcondicion());
        }        
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        ExportarPdf.exportJasperToPdf("DiarioVentas", data, parametro,"/resources/ventas/reportediarioventas.jasper");        
    }
    
    public void exportar(){    
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle,"Ventas");             
    } 
}
