package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.LoteService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
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
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ProductoProntoVencimiento extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloAlmacen;
    private ListModelList modeloDetalle;
    @Wire
    private Window winVencimiento;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Datebox dFecha;
    @Wire
    private Button btnProcesar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    LoteService loteService;
    @WireVariable
    AlmacenService almacenService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winVencimiento")
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
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }        
        
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecha.setValue(new Date());
        btnProcesar.focus();
    }

    private void procesar() {
        Almacen almacen=  (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloDetalle = new ListModelList(loteService.listaPorIdalmacenPorVencimiento(almacen.getIdalmacen(),dFecha.getValue()));
        lstDetalle.setModel(modeloDetalle);
    }

    

    private void validar() {
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        cboAlmacen.getValue();
    }
    
    private void imprimir(){
        validar();
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", almacen.getIdunidad().getIdempresa().getCruta());        
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("FECHA", dFecha.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/almacen/reporte/productoprontovencimiento.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle, "ProntoVencimiento");             
    }  
}

