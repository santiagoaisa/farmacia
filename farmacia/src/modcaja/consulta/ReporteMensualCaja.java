
package modcaja.consulta;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.caja.ResumenCobroPorFecha;
import com.zarcillo.service.PlanillaIngresoService;
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
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ReporteMensualCaja extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloUnidad;
    private ListModelList modeloDetalle;
    @Wire
    private Window winCaja;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Datebox dFecini;
    @Wire
    private Datebox dFecfin;
    @Wire
    private Button btnProcesar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nEfectivo;
    @Wire
    private Decimalbox nDebito;
    @Wire
    private Decimalbox nCredito;
    @Wire
    private Decimalbox nTotal;
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    PlanillaIngresoService planillaIngresoService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winCaja")
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
        dFecini.setValue(new Date(new Date().getYear(),new  Date().getMonth(), 1));
        dFecfin.setValue(new Date());
        btnProcesar.focus();
    }

    private void procesar() {
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        modeloDetalle = new ListModelList(planillaIngresoService.listaResumenCobroPorFechas(unidad.getIdunidad(),dFecini.getValue(),dFecfin.getValue()));
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }

    private void cargarPie() {
        BigDecimal nefectivo= new BigDecimal(BigInteger.ZERO);
        BigDecimal ndebito= new BigDecimal(BigInteger.ZERO);
        BigDecimal ncredito= new BigDecimal(BigInteger.ZERO);
        BigDecimal ntotal= new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        ResumenCobroPorFecha cpd;
        for (Listitem item : ldatos) {
            cpd= (ResumenCobroPorFecha) modeloDetalle.getElementAt(item.getIndex());            
            nefectivo = nefectivo.add(cpd.getNefectivo());
            ndebito = ndebito.add(cpd.getNtdebito());
            ncredito= ncredito.add(cpd.getNtcredito());
            ntotal= ntotal.add(cpd.getNtotal());
        }
        nEfectivo.setValue(nefectivo);
        nDebito.setValue(ndebito);
        nCredito.setValue(ncredito);
        nTotal.setValue(ntotal);
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

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/caja/reporte/reportemensualcaja.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle, usuario.getCnomusuario().trim());             
    }    
}
