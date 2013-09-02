package modcreditos.consulta;


import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.creditos.CronogramaCobro;
import com.zarcillo.dto.creditos.CronogramaCobroCliente;
import com.zarcillo.service.ListadoProveedorService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
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
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class DetalleCronogramaCobranza extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private UnidadNegocio unidad;
    private CronogramaCobro cronograma;
    private Date dFecha;
    @Wire
    private Window winDetalle;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nFactura;
    @Wire
    private Decimalbox nLetra;
    @Wire
    private Decimalbox nTotal;
     
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winDetalle")
    public void onCreate() throws NamingException {
        initComponets();
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
        mostrarDetalle();
    }
    
    @Listen("onDoubleClick = #lstDetalle")
    public void onDetalle(Event event) {
        mostrarDetalle();
    }

    
    public void initComponets() {
        unidad=(UnidadNegocio) winDetalle.getAttribute("UNIDAD");
        usuario=(Usuario) winDetalle.getAttribute("USUARIO");
        cronograma=(CronogramaCobro) winDetalle.getAttribute("CRONOGRAMA");
        dFecha=(Date) winDetalle.getAttribute("FECHA");
        
        modeloDetalle = new ListModelList(cronograma.getDetalleCronogramaCobroClienteCollection());
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    private void mostrarDetalle(){
        Window win = (Window) Executions.createComponents("/modulos/creditos/consulta/cronogramacobrosdocumento.zul", null, null);
        win.setClosable(true);
        CronogramaCobroCliente cronogramacliente = (CronogramaCobroCliente) modeloDetalle.getElementAt(lstDetalle.getSelectedIndex());
        win.setAttribute("CRONOGRAMACLIENTE", cronogramacliente);
        win.setAttribute("UNIDAD", unidad);
        win.setAttribute("USUARIO", usuario);
        win.setAttribute("FECHA", dFecha);        
        win.doModal();
    }


    private void cargarPie() {
        BigDecimal nfactura= new BigDecimal(BigInteger.ZERO);
        BigDecimal nletra= new BigDecimal(BigInteger.ZERO);
        BigDecimal ntotal= new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        CronogramaCobroCliente cpd;
        for (Listitem item : ldatos) {
            cpd=  (CronogramaCobroCliente) modeloDetalle.getElementAt(item.getIndex());            
            nfactura = nfactura.add(cpd.getNfactura());
            nletra = nletra.add(cpd.getNletra());
            ntotal= ntotal.add(cpd.getNtotal());
        }
        nFactura.setValue(nfactura);
        nLetra.setValue(nletra);
        nTotal.setValue(ntotal);
    }    

    
    private void imprimir(){
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECHA", dFecha);
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        Jasperreport rptreporte=new Jasperreport();
        rptreporte.setParent(winDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/detallecronogramapago.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle,"CronogramaCliente");             
    } 
}
