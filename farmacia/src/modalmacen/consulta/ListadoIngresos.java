package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.ProveedorService;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import modalmacen.util.FiltroProveedorIngreso;
import modmantenimiento.util.ConstraintCamposObligatorios;
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
public class ListadoIngresos extends SelectorComposer {

    private List<RegistroEntrada> listaDetalle=new ArrayList<>();
    private List<RegistroEntrada> listaFiltrada=new ArrayList<>();
    private Usuario usuario;
    private ListModelList modeloAlmacen;
    private ListModelList modeloDetalle;
    private ListModelList modeloProveedor;
    private ListModelList modeloMotivo;
    @Wire
    private Window winIngreso;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Combobox cboProveedor;
    @Wire
    private Combobox cboMotivo;
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
    AlmacenService almacenService;
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    @WireVariable
    RegistroEntradaService registroEntradaService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    @WireVariable
    ProveedorService proveedorService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winIngreso")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onSelect = #cboProveedor")
    public void onFiltroProveedor(Event event) {
        filtroProveedor();
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
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }        
        modeloMotivo = new ListModelList(motivoEntradaService.listaGeneral());
        cboMotivo.setModel(modeloMotivo);
        if(modeloMotivo.size()>0){
            cboMotivo.onInitRender(new Event("",cboMotivo));
            cboMotivo.close();
            cboMotivo.setSelectedIndex(0);
        }
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
        cboProveedor.setSelectedIndex(-1);
        cboProveedor.setText("");
    }
    private void habilitar(boolean enable){
        cboAlmacen.setDisabled(enable);
        dFecini.setDisabled(enable);
        dFecfin.setDisabled(enable);
        btnProcesar.setDisabled(enable);
        cboProveedor.setDisabled(!enable);
    }
    
    private void filtroProveedor(){
        Proveedor proveedor=(Proveedor) modeloProveedor.getElementAt(cboProveedor.getSelectedIndex());
        listaFiltrada=(List) CollectionUtils.select(listaDetalle,new FiltroProveedorIngreso(proveedor.getIdproveedor()));
        modeloDetalle = new ListModelList(listaFiltrada);
        lstDetalle.setModel(modeloDetalle);
        cargarPie();
    }
    
    private void procesar() {
        habilitar(true);
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        MotivoEntrada motivo=(MotivoEntrada) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        listaDetalle=registroEntradaService.listaPorIdalmacenPorMotivoPorFechas(almacen.getIdalmacen(),motivo.getIdmotivo(),dFecini.getValue(),dFecfin.getValue());
        listaFiltrada=listaDetalle;
        modeloDetalle = new ListModelList(listaDetalle);
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
        modeloProveedor=new ListModelList(proveedorService.listaGeneral());
        cboProveedor.setModel(modeloProveedor);
    }
    
    private void mostrarDetalle(int index){        
        Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detalleingreso.zul", null, null);
        win.setClosable(true);
        RegistroEntrada ingreso = (RegistroEntrada) modeloDetalle.getElementAt(index);
        win.setAttribute("INGRESO", ingreso);
        win.doModal();
    }

    private void cargarPie() {
        BigDecimal nafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal ninafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        RegistroEntrada vpd;
        for (Listitem item : ldatos) {
            vpd=(RegistroEntrada) modeloDetalle.getElementAt(item.getIndex());
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
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        cboAlmacen.getValue();
    }
    
    private void imprimir(){
        validar();
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());       
        HashMap parametro = new HashMap();
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("FECINI", dFecini.getValue());
        parametro.put("FECFIN", dFecfin.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());
        if(cboProveedor.getSelectedIndex()!=-1){
            Proveedor proveedor=(Proveedor) modeloProveedor.getElementAt(cboProveedor.getSelectedIndex());
            parametro.put("PROVEEDOR",proveedor.getCnomprovee());
        }       
        
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(listaFiltrada);
        ExportarPdf.exportJasperToPdf("LISTADOINGRESOS", data, parametro,"/resources/almacen/listadoingresos.jasper");        
    }
    
    public void exportar(){    
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle,"LISTADOINGRESOS");             
    } 
}


