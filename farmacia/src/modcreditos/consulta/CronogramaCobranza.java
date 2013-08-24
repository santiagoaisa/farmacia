package modcreditos.consulta;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.creditos.CronogramaCobro;
import com.zarcillo.dto.creditos.DetalleCronogramaCobroCliente;
import com.zarcillo.service.ListadoClienteService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
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
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CronogramaCobranza extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloUnidad;
    private List<DetalleCronogramaCobroCliente> listaDetalle=new ArrayList<>();
    @Wire
    private Window winCronograma;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Button btnProcesar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nFactura;
    @Wire
    private Decimalbox nLetra;
    @Wire
    private Decimalbox nTotal;
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ListadoClienteService listadoClienteService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winCronograma")
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
    
    @Listen("onClick = #btnDetalle")
    public void onImprimirDetalle(Event event) {
        imprimirDetalle();
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
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin()));
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }  
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        btnProcesar.focus();
    }

    private void procesar() {
        listaDetalle=listadoClienteService.listaDetalleCronogramaCobro();
        modeloDetalle = new ListModelList(listadoClienteService.listaCronogramaCobro());
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    private void mostrarDetalle(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Window win = (Window) Executions.createComponents("/modulos/creditos/consulta/detallecronogramacobranza.zul", null, null);
        win.setClosable(true);
        CronogramaCobro cronograma = (CronogramaCobro) modeloDetalle.getElementAt(lstDetalle.getSelectedIndex());
        win.setAttribute("CRONOGRAMA", cronograma);
        win.setAttribute("UNIDAD", unidad);
        win.setAttribute("USUARIO", usuario);
        win.setAttribute("FECHA", new Date());        
        win.doModal();
    }

    private void cargarPie() {
        BigDecimal nfactura= new BigDecimal(BigInteger.ZERO);
        BigDecimal nletra= new BigDecimal(BigInteger.ZERO);
        BigDecimal ntotal= new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        CronogramaCobro cpd;
        for (Listitem item : ldatos) {
            cpd=  (CronogramaCobro) modeloDetalle.getElementAt(item.getIndex());            
            nfactura = nfactura.add(cpd.getNfactura());
            nletra = nletra.add(cpd.getNletra());
            ntotal= ntotal.add(cpd.getNtotal());
        }
        nFactura.setValue(nfactura);
        nLetra.setValue(nletra);
        nTotal.setValue(ntotal);
    }    

    
    private void imprimir(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECFIN", new Date());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/cronogramapago.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    private void imprimirDetalle(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECFIN", new Date());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(listaDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/detallecronograma.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle, "Cronograma");             
    } 
}
