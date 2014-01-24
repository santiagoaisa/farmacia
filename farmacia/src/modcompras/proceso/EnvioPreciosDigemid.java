package modcompras.proceso;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.ListadoExistenciaService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import javax.naming.NamingException;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.PeriodoListener;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zarcillo.ExportarPdf;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
 
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class EnvioPreciosDigemid extends SelectorComposer implements PeriodoListener  {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloAlmacen;
    private MenuPeriodo menuperiodo;
    private Periodo periodo;
    @Wire
    private Window winDigemid;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nCosto;
    @Wire
    private Decimalbox nPcosto;
    @WireVariable
    AlmacenService almacenService;
    @WireVariable
    LineaService lineaService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ListadoExistenciaService listadoExistenciaService;
    @WireVariable
    PeriodoService periodoService;
    final Execution exec = Executions.getCurrent();
    private String user_login;

    @Listen("onCreate=window#winDigemid")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winDigemid.getFellow("mperiodo");
        menuperiodo = (MenuPeriodo) macro.getChildren().get(0);
        menuperiodo.setPeriodolistener(this);
        initComponets();
    }

    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) {
        imprimir();
    }
    
    @Listen("onClick = #btnDetalle")
    public void onImprimirDetalle() {
        imprimirDetalle();
    }


    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }

    @Listen("onClick = #btnProcesar")
    public void onProcesar(Event event) {
        procesar();
    }

    @Listen("onDoubleClick = #lstDetalle")
    public void onDetalle(Event event) {
        Listbox btn =(Listbox) event.getTarget();
        Listitem item = (Listitem) (btn.getSelectedItem());
        detalleDetalle(item.getIndex());
    }

    @Listen("onOK = #lstDetalle")
    public void onDetalleDetalle(Event event) {
        Listbox btn =(Listbox) event.getTarget();
        Listitem item = (Listitem) (btn.getSelectedItem());
        detalleDetalle(item.getIndex());
    }

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        menuperiodo.setLista(periodoService.listaGeneral());
        periodo = periodoService.buscarPorDfecha(new Date());//
        menuperiodo.setPeriododefecto(periodo);
    }

    private void procesar() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        lstDetalle.setMultiple(true);
        lstDetalle.setCheckmark(true);  
        cargarPie();
    }

    private void cargarPie() {
        BigDecimal ncosto = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        
        nCosto.setValue(ncosto);
        nPcosto.setValue(nprecio);
    }

    private void detalleDetalle(int index) {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detalleinventariovalorizado.zul", null, null);
        win.setClosable(true);
        win.setAttribute("USUARIO", usuario);
        win.setAttribute("ALMACEN", almacen);
        win.doModal();
    }

    public void imprimir() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("USUARIO", usuario.getCnomusuario());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        ExportarPdf.exportJasperToPdf("DetalleValorizado", data, parametro,"/resources/almacen/inventariovalorizado.jasper");        
        
    }
    
    public void imprimirDetalle() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Set<Listitem> ldatos = lstDetalle.getSelectedItems();
        
        HashMap parametro = new HashMap();
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("USUARIO", usuario.getCnomusuario());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(new ListModelList<>());
        ExportarPdf.exportJasperToPdf("Valorizado", data, parametro,"/resources/almacen/detalleinventariovalorizado.jasper");        
    }

    public void exportar(){
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        //EsportaExcel2(lstDetalle, almacen.getCnomalmacen().trim() + ".xls");
        
        ///ejemplo de exportacion                
        //ExportarHojaCalculo.exportListboxToExcel(lstDetalle, almacen.getCnomalmacen());
        String[] headers={"LINEA","VALOR COSTO","PRECIO COSTO","PORCENTAJE"};
        String[] fields={"idlinea","ncosto","pcosto","nporcentaje"};
        ExportarHojaCalculo.exportDataModelToExcel(headers, fields, modeloDetalle,almacen.getCnomalmacen().trim());                
    }

    @Override
    public void escribir(Periodo periodo) {
        this.periodo = periodo;
    }

    @Override
    public void validar() {
        cboAlmacen.getValue();
    }

}
