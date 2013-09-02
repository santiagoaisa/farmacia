package modventas.consulta;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.service.VendedorService;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.ResultadoVentaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zkex.zul.Jasperreport;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class VentaVendedorFecha extends SelectorComposer {

    private Usuario usuario;
    private RegistroSalida regsalida = new RegistroSalida();
    private ListModelList modeloUnidad;
    private ListModelList modeloDetalle;
    private ListModelList modeloVendedor;
    private Periodo periodo;
    @Wire
    private Window winVenta;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Combobox cboVendedor;
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
    VendedorService vendedorService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {
        initComponets();
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
        modeloVendedor = new ListModelList(vendedorService.listaGeneral());
        cboVendedor.setModel(modeloVendedor);
        if (modeloVendedor.size() > 0) {
            cboVendedor.onInitRender(new Event("", cboVendedor));
            cboVendedor.close();
            cboVendedor.setSelectedIndex(0);
        }
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecini.setValue(new Date());
        dFecfin.setValue(new Date());
        btnProcesar.focus();
    }

    private void procesar() {
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        modeloDetalle = new ListModelList(resultadoVentaService.listaVentaPorDocumentoPorIdunidadPorFechas(unidad.getIdunidad(),vendedor.getIdvendedor(),dFecini.getValue(),dFecfin.getValue()));
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
        cboVendedor.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.getValue();
        cboVendedor.getValue();
    }
    
    private void imprimir(){
        validar();
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECINI", dFecini.getValue());
        parametro.put("FECFIN", dFecfin.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());
        parametro.put("VENDEDOR", vendedor.getCnomvendedor());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        Jasperreport rptreporte=new Jasperreport();
        rptreporte.setParent(winVenta);
        rptreporte.setSrc("/modulos/ventas/reporte/reportediarioventas.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar(){    
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle,vendedor.getCnomvendedor().trim());             
    } 
}